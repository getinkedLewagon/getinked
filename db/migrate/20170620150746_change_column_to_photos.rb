class ChangeColumnToPhotos < ActiveRecord::Migration[5.0]
    def change
      change_table :photos do |t|
        t.remove :user_id
        t.references :artist, foreign_key: true
      end
  end
end
