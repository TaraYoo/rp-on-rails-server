class RemoveIndexFromLocations < ActiveRecord::Migration[5.2]
  def change
    remove_index :locations, :name
  end
end
