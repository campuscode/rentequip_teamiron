require 'rails_helper'
  feature 'user views equipments' do
  scenario 'successfull'  do

  equipment = Equipment.create(name:          'Betoneira',
                              description:    'Semi-nova',
                              supplier:       'Bosh')

  equipment1 = Equipment.create(name:          'furadeira',
                              description:     'novíssima',
                              supplier:        'Caterpilar')

      visit equipments_path

      expect(page).to have_content equipment.name
      expect(page).to have_content equipment.description
      expect(page).to have_content equipment.supplier

      expect(page).to have_content equipment1.name
      expect(page).to have_content equipment1.description
      expect(page).to have_content equipment1.supplier

    end
  end
