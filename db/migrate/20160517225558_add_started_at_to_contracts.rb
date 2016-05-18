class AddStartedAtToContracts < ActiveRecord::Migration
  def change
    add_column :contracts, :started_at, :date
  end
end
