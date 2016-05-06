class AddContractRefToEquipment < ActiveRecord::Migration
  def change
    add_reference :equipment, :contract, index: true, foreign_key: true
  end
end
