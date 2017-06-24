class AddColumnStyleIdToArtistStyles < ActiveRecord::Migration[5.0]
  def change
    add_reference :artist_styles, :style, foreign_key: true
  end
end
