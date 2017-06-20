class ChangeColumnToArtistStyle < ActiveRecord::Migration[5.0]
  def change
    change_table :artist_styles do |t|
    t.remove :styles_id
    t.references :style, foreign_key: true
   end
  end
end
