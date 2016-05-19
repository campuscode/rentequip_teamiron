FactoryGirl.define do
  factory :contract do
    responsable 'Luiz'
    customer
    amount 1
    delivery_address 'Av. Paulista 2020'
    rental_period 3
    started_at Time.zone.now
  end
end
