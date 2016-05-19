FactoryGirl.define do
  factory :customer do
    company_name 'Client MRV from factory'
    cnpj '012380/1001-99'
    contact_name 'Some name from factory'
    tel '12345679'
    contact_email 'something@from.factory'
    billing_address 'Av. Paulista 2020 - Factory'

  end
end
