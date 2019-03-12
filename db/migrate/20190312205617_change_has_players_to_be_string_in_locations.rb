class ChangeHasPlayersToBeStringInLocations < ActiveRecord::Migration[5.2]
  def change
    change_column :locations, :has_players, :string
  end
end
