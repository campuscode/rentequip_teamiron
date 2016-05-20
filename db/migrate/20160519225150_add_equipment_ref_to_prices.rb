class AddEquipmentRefToPrices < ActiveRecord::Migration
  def change
    add_reference :prices, :equipment, index: true, foreign_key: true
  end
end
