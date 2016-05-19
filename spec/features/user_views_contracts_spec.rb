require 'rails_helper'
feature 'user views one contract' do
  scenario 'successfully' do
    equipment1 = create(:equipment)

    equipment2 = create(:equipment, name: 'Martelo')

    contract = create(:contract, equipment: [equipment1, equipment2])

    visit contract_path contract

    expect(page).to have_content contract.responsable
    expect(page).to have_content I18n.l(contract.deadline, format: :short)
    expect(page).to have_content contract.customer.name
    expect(page).to have_content contract.equipment.find(1).name
    expect(page).to have_content contract.equipment.find(2).name
    expect(page).to have_content contract.amount
    expect(page).to have_content contract.delivery_address
    expect(page).to have_content I18n.l(contract.started_at, format: :long)
    expect(page).to have_content contract.id
  end
end
