require 'rails_helper'

feature 'users create receipt' do
  scenario 'successfully' do
    equipment1 = create(:equipment)
    equipment2 = create(:equipment, name: 'Furadeira')

    client = create(:client)

    contract = create(:contract, client: client,
                       equipment: [equipment1, equipment2])

    visit contract_path(contract)

    click_on 'Emitir Recibo'

    expect(page).to have_content 'Recibo de Entrega'
    expect(page).to have_content contract.responsable
    expect(page).to have_content client.name
    expect(page).to have_content client.cnpj
    expect(page).to have_content equipment1.name
    expect(page).to have_content equipment2.name
    expect(page).to have_content contract.rental_period
    expect(page).to have_content contract.address
    expect(page).to have_content contract.created_at
    expect(page).to have_content contract.id
  end
end
