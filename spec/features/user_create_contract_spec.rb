require 'rails_helper'

feature 'users create contract' do
  scenario 'successfully' do
    equipment = create(:equipment)
    customer = create(:customer)
    contract = build(:contract, customer: customer)

    rental_period = 3

    visit new_contract_path


    fill_in 'Responsável',            with: contract.responsable
    select rental_period,             from: 'Duração'
    select customer.company_name,     from: 'Cliente'
    check equipment.name
    fill_in 'Valor do Contrato',     with: contract.amount
    fill_in 'Endereço de Entrega',   with: contract.delivery_address
    fill_in 'Data de início',        with: contract.started_at

    click_on 'Emitir Contrato'
    save_and_open_page

    expect(page).to have_content contract.responsable
    expect(page).to have_content contract.rental_period
    expect(page).to have_content I18n.l(contract.started_at +
                                        rental_period.days, format: :short)
    expect(page).to have_content contract.customer.company_name
    expect(page).to have_content equipment.name
    expect(page).to have_content contract.amount
    expect(page).to have_content contract.delivery_address
  end

  scenario 'users create second contract with same equipment from first' do
    equipment = create(:equipment)

    contract = create(:contract, equipment: [equipment])
    contract2 = create(:contract, equipment: [equipment])

    visit contract_path(contract)
    expect(page).to have_content equipment.name

    visit contract_path(contract2)
    expect(page).to have_content equipment.name
  end

  scenario 'users create blank contract' do
    visit new_contract_path

    click_on 'Emitir Contrato'

    expect(page).to have_content 'Favor preencher os campos obrigatórios'
  end
end
