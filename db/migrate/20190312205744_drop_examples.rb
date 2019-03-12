class DropExamples < ActiveRecord::Migration[5.2]
  def change
    drop_table :examples
  end
end
