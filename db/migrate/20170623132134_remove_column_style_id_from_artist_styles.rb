class RemoveColumnStyleIdFromArtistStyles < ActiveRecord::Migration[5.0]
  def change
    remove_column :artist_styles, :style_id
  end
end
