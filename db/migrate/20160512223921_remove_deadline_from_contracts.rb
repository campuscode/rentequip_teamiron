class RemoveDeadlineFromContracts < ActiveRecord::Migration
  def change
    remove_column :contracts, :deadline, :datetime
  end
end
