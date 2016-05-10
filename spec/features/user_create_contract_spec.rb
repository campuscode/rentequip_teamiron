require 'rails_helper'

feature 'user create contract' do
  scenario 'successfully' do
    equipment = create(:equipment)

    contract = Contract.new(responsable: 'Luiz',
                            deadline: 5.days.from_now,
                            client: 'MVR Engenharia',
                            amount: 1_000_000,
                            delivery_address: 'Av. Paulista 9876')

    visit new_contract_path

    fill_in 'Responsável',           with: contract.responsable
    fill_in 'Prazo',                 with: contract.deadline
    fill_in 'Cliente',               with: contract.client
    check equipment.name
    fill_in 'Valor do Contrato',     with: contract.amount
    fill_in 'Endereço de Entrega',   with: contract.delivery_address

    click_on 'Emitir Contrato'

    expect(page).to have_content contract.responsable
    expect(page).to have_content I18n.l(contract.deadline, format: :super_short)
    expect(page).to have_content contract.client
    expect(page).to have_content equipment.name
    expect(page).to have_content contract.amount
    expect(page).to have_content contract.delivery_address
  end

  scenario 'users create second contract with same equipment from frist' do
    equipment = create(:equipment)

    contract = create(:contract, equipment: [equipment])
    contract2 = create(:contract, equipment: [equipment])

    visit contract_path(contract)
    expect(page).to have_content equipment.name

    visit contract_path(contract2)
    expect(page).to have_content equipment.name
  end
end
