class RenameColumnClientIdToCostumerId < ActiveRecord::Migration
  def change
    rename_column :contracts, :client_id, :costumer_id
  end
end
