class CreateChatrooms < ActiveRecord::Migration[5.0]
  def change
    create_table :chatrooms do |t|

      t.references :appointment, foreign_key: true
      t.references :user, foreign_key: true
      t.references :artist, foreign_key: true
      t.timestamps
    end
  end
end
