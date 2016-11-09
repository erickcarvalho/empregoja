require 'rails_helper'

  feature 'User registers category' do
    scenario 'successfully' do

      visit new_category_path

      fill_in 'Categoria', with: 'Desenvolvedor'
      click_on 'Criar Categoria'

      expect(page).to have_content('Categoria criada com sucesso')

    end

    scenario 'and fail on duplicated' do

      #setup
      Category.create( name: 'Analista')

#execucao
      visit new_category_path

      fill_in 'Categoria', with: 'Analista'
      click_on 'Criar Categoria'
#expectativas
      expect(page).to have_content 'Não foi possivel salvar'

    end

    scenario 'and should fill all fields' do

      visit new_category_path

      click_on 'Criar Categoria'

      expect(page).to have_content 'Não foi possivel salvar'
      # expect(page).to match(/Nao foi possivel salvar/)

    end
  end
