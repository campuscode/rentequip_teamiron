require 'rails_helper'

feature 'users create receipt' do
  scenario 'successfully' do
    equipment1 = create(:equipment)
    equipment2 = create(:equipment, name: 'Furadeira', serial_number: '999AA')

    customer = create(:customer)

    contract = create(:contract, customer: customer,
                                 equipment: [equipment1, equipment2])

    visit contract_path(contract)

    click_on 'Emitir Recibo de Entrega'

    expect(page).to have_content 'Recibo de Entrega'
    expect(page).to have_content contract.responsable
    expect(page).to have_content customer.company_name
    expect(page).to have_content customer.cnpj
    expect(page).to have_content equipment1.name
    expect(page).to have_content equipment2.name
    expect(page).to have_content equipment1.serial_number
    expect(page).to have_content equipment2.serial_number
    expect(page).to have_content contract.rental_period
    expect(page).to have_content contract.delivery_address
    expect(page).to have_content contract.id
  end

  scenario 'show same receipt for the same contract' do
    equipment1 = create(:equipment)
    equipment2 = create(:equipment, name: 'Furadeira', serial_number: '999AA')

    customer = create(:customer)

    contract = create(:contract, customer: customer,
                                 equipment: [equipment1, equipment2])

    visit contract_path(contract)

    click_on 'Emitir Recibo de Entrega'

    visit contract_path(contract)

    expect { click_on 'Emitir Recibo de Entrega' }.to_not change {
      Receipt.count
    }
  end
end
