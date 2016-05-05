require 'rails_helper'

feature 'user create contract' do

  scenario 'successfully' do
    equipment = Equipment.create(name: 'Furadeira',
                                 description: 'Auto Impacto',
                                 supplier: 'Bosh')

    contract = Contract.new(responsable: 'Luiz',
                            deadline: 5.days.from_now,
                            client: 'MVR Engenharia',
                            equipments: equipment,
                            amount: 1000000,
                            delivery_address: 'Av. Paulista 9876')

    visit new_contract_path

    fill_in 'Responsável',           with: contract.responsable
    fill_in 'Prazo',                 with: contract.deadline
    fill_in 'Cliente',               with: contract.client
    select equipment.name,           from: 'Equipamentos'
    fill_in 'Valor do Contrato',     with: contract.amount
    fill_in 'Endereço de Entrega',   with: contract.delivery_address

    click_on 'Emitir Contrato'

    expect(page).to have_content contract.responsable
    expect(page).to have_content contract.deadline
    expect(page).to have_content contract.client
    expect(page).to have_content contract.equipments
    expect(page).to have_content contract.amount
    expect(page).to have_content contract.delivery_address
  end
end
