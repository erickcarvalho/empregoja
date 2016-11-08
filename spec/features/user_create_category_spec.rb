require 'rails_helper'

  feature 'User registers category' do
    scenario 'successfully' do

      visit new_category_path

      fill_in 'Categoria', with: 'Desenvolvedor'
      click_on 'Criar Categoria'

      expect(page).to have_content(text: 'Categoria criada com sucesso')

    end

    scenario 'and fail on duplicated' do

      #setup
      Category.create( name: 'Analista')

#execucao
      visit new_category_path

      fill_in 'Categoria', with: 'Analista'
      click_on 'Criar Categoria'
#expectativas
      expect(page).to have_content(text: 'Categoria já cadastrada')

    end

    scenario 'and should fill all fields' do

      visit new_category_path

      click_on 'Criar categoria'

      expect(page).to have_content 'Não é possível criar categoria em branco'

    end
  end
