require 'rails_helper'

feature 'Visitor does not see expired jobs' do
  scenario 'successfully' do
    company = Company.create(name: 'Campus Code',
                              location: 'São Paulo',
                              phone: '11 2369 3476',
                              mail: 'contato@campuscode.com.br')

    category = Category.create(name: 'Desenvolvedor')

    travel_to 91.days.ago do
      company.jobs.create(title: 'Desenvolvedor Rails',
                           description: 'Desenvolvedor Full Stack Rails',
                           location: 'São Paulo - SP',
                           category: category)
    end

    visit root_path

    expect(page).not_to have_content('Desenvolvedor Rails')
  end

  scenario 'visit expired job page' do
    company = Company.create(name: 'Campus Code',
                              location: 'São Paulo',
                              phone: '11 2369 3476',
                              mail: 'contato@campuscode.com.br')


    category = Category.create(name: 'Desenvolvedor')

    travel_to 91.days.ago do
      @job = company.jobs.create(title: 'Desenvolvedor Rails',
                           description: 'Desenvolvedor Full Stack Rails',
                           location: 'São Paulo - SP',
                           category: category)
    end

    visit job_path(@job)

    expect(page).to have_content('Vaga Expirada')
  end
end
