require 'rails_helper'
feature 'user create prices' do
  scenario 'successfull' do

    equipment = create(:equipment)
    visit new_price_path
    
    select equipment.name,      from: 'Equipamento'
    select 3,                   from: 'Duração'
    fill_in 'Preço',            with: 1000

    click_on 'Cadastrar Preço'

    expect(page).to have_content equipment.name
    expect(page).to have_content 3
    expect(page).to have_content 1000
  end
end
