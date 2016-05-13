require 'rails_helper'

feature 'users create receipt' do
  scenario 'successfully' do
    equipment1 = create(:equipment)
    equipment2 = create(:equipment, name: 'Furadeira', serial_number: '999AA')

    client = create(:client)

    contract = create(:contract, client: client,
                       equipment: [equipment1, equipment2])

    visit contract_path(contract)

    click_on 'Emitir Recibo de Entrega'

    expect(page).to have_content 'Recibo de Entrega'
    expect(page).to have_content contract.responsable
    expect(page).to have_content client.name
    expect(page).to have_content client.cnpj
    expect(page).to have_content equipment1.name
    expect(page).to have_content equipment2.name
    expect(page).to have_content equipment1.serial_number
    expect(page).to have_content equipment2.serial_number
    expect(page).to have_content contract.rental_period
    expect(page).to have_content contract.delivery_address
    expect(page).to have_content contract.id
  end
end
