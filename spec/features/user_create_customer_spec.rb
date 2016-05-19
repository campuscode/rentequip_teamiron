require 'rails_helper'

feature 'users create customer' do
  scenario 'successfully' do
    customer = build(:customer)

    visit new_customer_path

    fill_in 'Razão Social',         with: customer.company_name
    fill_in 'CNPJ',                 with: customer.cnpj
    fill_in 'Contato',              with: customer.contact_name
    fill_in 'Telefone',             with: customer.tel
    fill_in 'Email',                with: customer.contact_email
    fill_in 'Endereço de Cobrança', with: customer.billing_address

    click_on 'Cadastrar Cliente'

    expect(page).to have_content customer.company_name
    expect(page).to have_content customer.cnpj
    expect(page).to have_content customer.contact_name
    expect(page).to have_content customer.tel
    expect(page).to have_content customer.contact_email
    expect(page).to have_content customer.billing_address
  end

  scenario 'all field from customer form must be valid' do
    customer = build(:customer, company_name: '')

    visit new_customer_path

    fill_in 'Razão Social',         with: customer.company_name
    fill_in 'CNPJ',                 with: customer.cnpj
    fill_in 'Contato',              with: customer.contact_name
    fill_in 'Telefone',             with: customer.tel
    fill_in 'Email',                with: customer.contact_email
    fill_in 'Endereço de Cobrança', with: customer.billing_address

    click_on 'Cadastrar Cliente'

    expect(page).to have_content 'Favor preencher os campos obrigatórios'
  end
end
