require 'rails_helper'
feature 'user views all contracts' do
  scenario 'successfully' do
    contract = create(:contract, client: 'Tenda')

    contract_2 = create(:contract, client: 'Tenda 2')

    contract_3 = create(:contract, client: 'Tenda 3')

    visit contracts_path

    expect(page).to have_content contract.id
    expect(page).to have_content contract.client
    expect(page).to have_content I18n.l(contract.deadline, format: :super_short)

    expect(page).to have_content contract_2.id
    expect(page).to have_content contract_2.client
    expect(page).to have_content I18n.l(contract.deadline, format: :super_short)

    expect(page).to have_content contract_3.id
    expect(page).to have_content contract_3.client
    expect(page).to have_content I18n.l(contract.deadline, format: :super_short)
  end

  scenario 'user clic on the contract' do
    equipment1 = create(:equipment)
    contract = create(:contract, equipment: [equipment1])

    Contract.create(deadline: 20.days.from_now, client: 'MVR Engenharia 2')

    Contract.create(deadline: 30.days.from_now, client: 'MVR Engenharia 2')

    visit contracts_path

    within('tr:nth-child(2)') do
      click_on 'Ver detalhes'
    end

    expect(page).to have_content contract.responsable
    expect(page).to have_content I18n.l(contract.deadline, format: :super_short)
    expect(page).to have_content contract.client
    expect(page).to have_content contract.equipment.find(1).name
    expect(page).to have_content contract.amount
    expect(page).to have_content contract.delivery_address
    expect(page).to have_content contract.created_at
    expect(page).to have_content contract.id
  end
end
