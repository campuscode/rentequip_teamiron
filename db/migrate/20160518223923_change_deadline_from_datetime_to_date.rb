class ChangeDeadlineFromDatetimeToDate < ActiveRecord::Migration
  def change
    change_column :contracts, :deadline, :date
  end
end
