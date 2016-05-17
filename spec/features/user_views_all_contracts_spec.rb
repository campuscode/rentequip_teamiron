require 'rails_helper'
feature 'user views all contracts' do
  scenario 'successfully' do

    customer = create(:customer, name: 'Tenda')
    customer2 = create(:customer, name: 'Tenda2')
    customer3 = create(:customer, name: 'Tenda3')

    contract = create(:contract, customer: customer )

    contract_2 = create(:contract, customer: customer2)

    contract_3 = create(:contract, customer: customer3)

    visit contracts_path

    expect(page).to have_content contract.id
    expect(page).to have_content contract.customer.name
    expect(page).to have_content I18n.l(contract.deadline, format: :super_short)

    expect(page).to have_content contract_2.id
    expect(page).to have_content contract_2.customer.name
    expect(page).to have_content I18n.l(contract.deadline, format: :super_short)

    expect(page).to have_content contract_3.id
    expect(page).to have_content contract_3.customer.name
    expect(page).to have_content I18n.l(contract.deadline, format: :super_short)
  end

  scenario 'user clic on the contract' do

    customer = create(:customer)

    equipment1 = create(:equipment)

    contract = create(:contract, equipment: [equipment1])

    Contract.create(deadline: 20.days.from_now, customer: customer)

    Contract.create(deadline: 30.days.from_now, customer: customer)

    visit contracts_path

    within('tr:nth-child(2)') do
      click_on 'Ver detalhes'
    end

    expect(page).to have_content contract.responsable
    expect(page).to have_content I18n.l(contract.deadline, format: :super_short)
    expect(page).to have_content contract.customer.name
    expect(page).to have_content contract.equipment.find(1).name
    expect(page).to have_content contract.amount
    expect(page).to have_content contract.delivery_address
    expect(page).to have_content contract.created_at
    expect(page).to have_content contract.id
  end
end
