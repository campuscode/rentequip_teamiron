require 'rails_helper'

feature 'user views all contracts' do

  scenario 'successfully' do
    contract = Contract.create(responsable: 'Luiz',
                            deadline: 5.days.from_now,
                            client: 'MVR Engenharia',
                            equipments: 'Furadeira, empilhadeira',
                            amount: 1000000,
                            delivery_address: 'Av. Paulista 9876')

    contract_2 = Contract.create(responsable: 'Raul',
                            deadline: 20.days.from_now,
                            client: 'MVR Engenharia 2',
                            equipments: 'Furadeira, empilhadeira, martelos',
                            amount: 5000000,
                            delivery_address: 'Av. Brigadeiro Luiz Antonio 2020')

    contract_3 = Contract.create(responsable: 'Jonas',
                            deadline: 30.days.from_now,
                            client: 'MVR Engenharia 2',
                            equipments: 'Furadeira, empilhadeira',
                            amount: 2000000,
                            delivery_address: 'Av. Paulista 1234')

    visit contracts_path

    expect(page).to have_content contract.id
    expect(page).to have_content contract.client
    expect(page).to have_content contract.deadline

    expect(page).to have_content contract_2.id
    expect(page).to have_content contract_2.client
    expect(page).to have_content contract_2.deadline

    expect(page).to have_content contract_3.id
    expect(page).to have_content contract_3.client
    expect(page).to have_content contract_3.deadline


  end
  scenario 'user clic on the contract' do
    contract = Contract.create(responsable: 'Luiz',
                            deadline: 5.days.from_now,
                            client: 'MVR Engenharia',
                            equipments: 'Furadeira, empilhadeira',
                            amount: 1000000,
                            delivery_address: 'Av. Paulista 9876')

    contract_2 = Contract.create(responsable: 'Raul',
                            deadline: 20.days.from_now,
                            client: 'MVR Engenharia 2',
                            equipments: 'Furadeira, empilhadeira, martelos',
                            amount: 5000000,
                            delivery_address: 'Av. Brigadeiro Luiz Antonio 2020')

    contract_3 = Contract.create(responsable: 'Jonas',
                            deadline: 30.days.from_now,
                            client: 'MVR Engenharia 2',
                            equipments: 'Furadeira, empilhadeira',
                            amount: 2000000,
                            delivery_address: 'Av. Paulista 1234')

    visit contracts_path

    expect(page).to have_content contract.id
    expect(page).to have_content contract.client
    expect(page).to have_content contract.deadline

    expect(page).to have_content contract_2.id
    expect(page).to have_content contract_2.client
    expect(page).to have_content contract_2.deadline

    expect(page).to have_content contract_3.id
    expect(page).to have_content contract_3.client
    expect(page).to have_content contract_3.deadline

    within("tr:nth-child(2)") do
      click_on "Ver detalhes"
    end

    expect(page).to have_content contract.responsable
    expect(page).to have_content contract.deadline
    expect(page).to have_content contract.client
    expect(page).to have_content contract.equipments
    expect(page).to have_content contract.amount
    expect(page).to have_content contract.delivery_address
    expect(page).to have_content contract.created_at
    expect(page).to have_content contract.id
  end
end
