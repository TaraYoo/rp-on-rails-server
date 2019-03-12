class AddUserToBokbulboks < ActiveRecord::Migration[5.2]
  def change
    add_reference :bokbulboks, :user, foreign_key: true
  end
end
