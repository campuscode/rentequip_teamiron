class RenameFromBillingAddresToBillingAddressInCustomers < ActiveRecord::Migration
  def change
    rename_column :customers, :billing_addres, :billing_address
  end
end
