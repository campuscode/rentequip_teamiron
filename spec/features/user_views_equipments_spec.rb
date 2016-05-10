require 'rails_helper'
feature 'user views equipments' do
  scenario 'successfull' do
    equipment = create(:equipment)
    equipment1 = create(:equipment, name: 'Furadeira')

    visit equipment_index_path

    expect(page).to have_content equipment.name
    expect(page).to have_content equipment.description
    expect(page).to have_content equipment.supplier

    expect(page).to have_content equipment1.name
    expect(page).to have_content equipment1.description
    expect(page).to have_content equipment1.supplier
  end

  scenario 'no equipment available' do
    visit equipment_index_path

    expect(page).to have_content 'Nenhum equipamento disponível no momento.'
  end
end
