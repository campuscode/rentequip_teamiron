require 'rails_helper'
feature 'user views price table' do
  scenario 'successfull' do
    equipment1 = create(:equipment)
    equipment2 = create(:equipment, name: 'Furadeira')
    price1 = create(:price, equipment: equipment1)
    price2 = create(:price, equipment: equipment2, duration: 30)

    visit prices_path

    expect(page).to have_content price1.equipment.name
    expect(page).to have_content price1.duration
    expect(page).to have_content price1.total_value

    expect(page).to have_content price2.equipment.name
    expect(page).to have_content price2.duration
    expect(page).to have_content price2.total_value
  end

  scenario 'blank' do
    visit prices_path

    expect(page).to have_content
    'Tabela não carregada, tente recarregar a página'
  end
end
