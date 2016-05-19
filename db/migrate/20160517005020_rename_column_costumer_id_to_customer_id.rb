class RenameColumnCostumerIdToCustomerId < ActiveRecord::Migration
  def change
    rename_column :contracts, :costumer_id, :customer_id
  end
end
