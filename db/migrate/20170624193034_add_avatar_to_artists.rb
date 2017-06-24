class AddAvatarToArtists < ActiveRecord::Migration[5.0]
  def change
    add_column :artists, :avatar, :string
  end
end
