require 'rails_helper'

feature 'User edits company' do
  scenario 'successfully' do

    company = Company.create(name: 'Campus Code',
                          location: 'São Paulo',
                          mail: 'contato@campus.com.br',
                          phone: '2369-3476')

    visit edit_company_path(company)

    # expect(page).to have_content(company.name)

    fill_in 'Nome', with: 'Microsoft Company'

    click_on 'Salvar Empresa'

    expect(page).to have_content('Altearação realizada')
    expect(page).to have_content('Microsoft Company')

  end

  scenario 'Try to input empty value' do

    company = Company.create(name: 'Campus Code',
                          location: 'São Paulo',
                          mail: 'contato@campus.com.br',
                          phone: '2369-3476')

    visit edit_company_path(company)

    fill_in 'Nome', with: ''

    click_on 'Salvar Empresa'

    expect(page).to have_content('Não é possível salvar')

  end
end
