class RemoveNameFromPrices < ActiveRecord::Migration
  def change
    remove_column :prices, :name, :string
  end
end
