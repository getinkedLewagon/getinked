class RemoveStyleFromArtists < ActiveRecord::Migration[5.0]
  def change
    remove_column :artists, :style
  end
end
