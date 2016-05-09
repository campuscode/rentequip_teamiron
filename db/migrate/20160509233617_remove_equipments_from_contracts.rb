class RemoveEquipmentsFromContracts < ActiveRecord::Migration
  def change
    remove_column :contracts, :equipments, :string
  end
end
