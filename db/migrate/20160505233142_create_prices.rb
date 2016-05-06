class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.string :name
      t.integer :duration
      t.float :total_value

      t.timestamps null: false
    end
  end
end
