class RemoveEquipmentRefFromContracts < ActiveRecord::Migration
  def change
    remove_reference :contracts, :equipment, index: true, foreign_key: true
  end
end
