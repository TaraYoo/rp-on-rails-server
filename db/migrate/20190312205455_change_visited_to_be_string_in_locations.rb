class ChangeVisitedToBeStringInLocations < ActiveRecord::Migration[5.2]
  def change
    change_column :locations, :visited, :string
  end
end
