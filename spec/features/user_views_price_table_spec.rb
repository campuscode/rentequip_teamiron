require 'rails_helper'
  feature 'user views price table' do
    scenario 'successfull' do
      equipment = create(:equipment)
      equipment1 = create(:equipment, name: 'Furadeira')
      price = create(:price)
      price1 = create(:prince,
                      duration: 30)

      visit prices_path

      expect(page).to have_content price.name
      expect(page).to have_content price.duration
      expect(page).to have_content price.total_value

      expect(page).to have_content price1.name
      expect(page).to have_content price1.duration
      expect(page).to have_content price1.total_value
    end

    scenario 'blank' do

      visit prices_path

      expect(page).to_not have_content price.name
      expect(page).to_not have_content price.duration
      expect(page).to_not have_content price.total_value

      expect(page).to_not have_content price1.name
      expect(page).to_not have_content price1.duration
      expect(page).to_not have_content price1.total_value

      expect(page).to have_content
      'Tabela não carregada, tente recarregar a página'
    end
  end
