class AddColumnsToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :company_name, :string
    add_column :customers, :contact_name, :string
    add_column :customers, :tel, :string
    add_column :customers, :contact_email, :string
    add_column :customers, :billing_addres, :string
  end
end
