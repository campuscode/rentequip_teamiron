class AddReceiptRefToContracts < ActiveRecord::Migration
  def change
    add_reference :contracts, :receipt, index: true, foreign_key: true
  end
end
