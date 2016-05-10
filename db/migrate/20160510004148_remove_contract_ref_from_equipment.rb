class RemoveContractRefFromEquipment < ActiveRecord::Migration
  def change
    remove_reference :equipment, :contract, index: true, foreign_key: true
  end
end
