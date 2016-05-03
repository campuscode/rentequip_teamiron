class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
      t.string :responsable
      t.datetime :deadline
      t.string :client
      t.string :equipments
      t.integer :amount
      t.string :delivery_address

      t.timestamps null: false
    end
  end
end
