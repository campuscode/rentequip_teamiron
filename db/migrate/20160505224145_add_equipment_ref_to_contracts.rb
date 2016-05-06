class AddEquipmentRefToContracts < ActiveRecord::Migration
  def change
    add_reference :contracts, :equipment, index: true, foreign_key: true
  end
end
