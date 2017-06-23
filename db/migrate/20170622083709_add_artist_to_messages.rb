class AddArtistToMessages < ActiveRecord::Migration[5.0]
  def change
    change_table :messages do |t|
      t.references :artist, foreign_key: true
    end
  end
end
