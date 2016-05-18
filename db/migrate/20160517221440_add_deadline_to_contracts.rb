class AddDeadlineToContracts < ActiveRecord::Migration
  def change
    add_column :contracts, :deadline, :datetime
  end
end
