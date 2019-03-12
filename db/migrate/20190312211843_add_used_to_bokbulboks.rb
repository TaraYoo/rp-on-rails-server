class AddUsedToBokbulboks < ActiveRecord::Migration[5.2]
  def change
    add_column :bokbulboks, :used, :boolean, default: false
  end
end
