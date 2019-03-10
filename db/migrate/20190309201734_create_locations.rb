class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :name, null: false, index: { unique: true }
      t.text :plot
      t.boolean :visited, default: false
      t.text :outcome
      t.boolean :has_players, default: false

      t.timestamps
    end
  end
end
