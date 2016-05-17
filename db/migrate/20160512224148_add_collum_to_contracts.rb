class AddCollumToContracts < ActiveRecord::Migration
  def change
    add_column :contracts, :rental_period, :integer
  end
end
