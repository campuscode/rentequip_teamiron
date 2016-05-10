class CreateJoinContractsEquipment < ActiveRecord::Migration
  def change
    create_join_table :contracts, :equipment do |t|
      t.index :contract_id
      t.index :equipment_id
    end
  end
end
