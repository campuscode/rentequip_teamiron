require 'rails_helper'
feature 'user views all contracts' do
  scenario 'successfully' do
    equipment = create(:equipment)

    customer = create(:customer, company_name: 'Tenda')
    customer2 = create(:customer, company_name: 'Tenda2')
    customer3 = create(:customer, company_name: 'Tenda3')

    contract = create(:contract, customer: customer, equipment: [equipment])

    contract_2 = create(:contract, customer: customer2, equipment: [equipment])

    contract_3 = create(:contract, customer: customer3, equipment: [equipment])

    visit contracts_path

    expect(page).to have_content contract.id
    expect(page).to have_content contract.customer.company_name
    expect(page).to have_content I18n.l(contract.deadline, format: :short)

    expect(page).to have_content contract_2.id
    expect(page).to have_content contract_2.customer.company_name
    expect(page).to have_content I18n.l(contract.deadline, format: :short)

    expect(page).to have_content contract_3.id
    expect(page).to have_content contract_3.customer.company_name
    expect(page).to have_content I18n.l(contract.deadline, format: :short)

  end

  scenario 'user clic on the contract' do
    customer = create(:customer)

    equipment1 = create(:equipment)

    contract = create(:contract, equipment: [equipment1])

    Contract.create(rental_period: 3, customer: customer)

    Contract.create(rental_period: 7, customer: customer)

    visit contracts_path

    within('tr:nth-child(2)') do
      click_on 'Ver detalhes'
    end

    expect(page).to have_content contract.responsable
    expect(page).to have_content I18n.l(contract.deadline, format: :short)
    expect(page).to have_content contract.customer.company_name
    expect(page).to have_content contract.equipment.find(1).name
    expect(page).to have_content contract.amount
    expect(page).to have_content contract.delivery_address
    expect(page).to have_content I18n.l(contract.started_at, format: :long)
    expect(page).to have_content contract.id
  end
end
