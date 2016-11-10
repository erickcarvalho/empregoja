require 'rails_helper'

feature 'Visitor view recent jobs' do
  scenario 'on home page' do
    company = Company.create(name:     'Campus Code',
                             location: 'São Paulo',
                             mail:     'contato@campuscode.com.br',
                             phone:    '2369-3476')

    category = Category.create(name: 'Desenvolvedor')

    Job.create(title: 'Vaga de Dev',
               description: 'Dev Junior Rails com ao menos um projeto',
               location: 'São Paulo',
               company: company,
               category: category)

    visit root_path

    # primeira elemento com o css "jobs" da pagina
    within('#jobs div:first-child') do
      expect(page).to have_content('Novidade')
    end
  end

  scenario 'only on recent jobs' do
    company = Company.create(name:     'Campus Code',
                             location: 'São Paulo',
                             mail:     'contato@campuscode.com.br',
                             phone:    '2369-3476')

    category = Category.create(name: 'Desenvolvedor')

    travel_to 6.days.ago do
      Job.create(title: 'Vaga de Dev',
                 description: 'Dev Junior Rails com ao menos um projeto',
                 location: 'São Paulo',
                 company: company,
                 category: category)

    end

    visit root_path

    expect(page).not_to have_content('Novidade')
  end
end
