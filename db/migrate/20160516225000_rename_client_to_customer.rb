class RenameClientToCustomer < ActiveRecord::Migration
  def change
    rename_table :clients, :customers
  end
end
