# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
equipment = Equipment.create(name: 'Furadeira', description: 'Auto Impacto',
                             supplier: 'Bosh')
equipment2 = Equipment.create(name: 'Betoneira', description: '120 litros',
                              supplier: 'Nagano')
customer = Customer.create(name: 'MRV', cnpj: '10.654.456/0001-89')
customer2 = Customer.create(name: 'Tenda', cnpj: '15.654.764/0001-90')
price = Price.create(name: 'Banana', duration: 3, total_value: 1000)
price2 = Price.create(name: 'Abacaxi', duration: 7, total_value: 2000)
contract = Contract.create(responsable: 'Paulo', amount: 2000,
                            delivery_address: 'Av. Paulista', rental_period: 3,
                            customer: customer, equipment: [equipment])
contract2 = Contract.create(responsable: 'Carlos', amount: 3000,
                            delivery_address: 'Av. das Aves', rental_period: 7,
                            customer: customer2,
                            equipment: [equipment, equipment2])
Receipt.create(contract: contract)
Receipt.create(contract: contract2)
