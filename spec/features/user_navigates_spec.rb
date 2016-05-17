require 'rails_helper'

feature 'user navigates' do
  scenario 'to contracts list' do
    visit root_path
    click_on 'Contratos'

    expect(current_path).to eq(contracts_path)
  end
  scenario 'to equipment list' do
    visit root_path
    click_on 'Equipamentos'

    expect(current_path).to eq(equipment_index_path)
  end
  scenario 'to prices list' do
    visit root_path
    click_on 'Preços'

    expect(current_path).to eq(prices_path)
  end
end
