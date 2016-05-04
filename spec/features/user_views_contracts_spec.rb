require 'rails_helper'

feature 'user views one contract' do

  scenario 'successfully' do
    contract = Contract.create(responsable: 'Luiz',
                            deadline: 5.days.from_now,
                            client: 'MVR Engenharia',
                            equipments: 'Furadeira, empilhadeira',
                            amount: 1000000,
                            delivery_address: 'Av. Paulista')
    visit contract_path contract

    expect(page).to have_content contract.responsable
    expect(page).to have_content I18n.l(contract.deadline, format: :super_short)
    expect(page).to have_content contract.client
    expect(page).to have_content contract.equipments
    expect(page).to have_content contract.amount
    expect(page).to have_content contract.delivery_address
    expect(page).to have_content contract.created_at
    expect(page).to have_content contract.id
  end
end
