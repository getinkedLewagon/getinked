class AddOmniauthToArtists < ActiveRecord::Migration[5.0]
  def change
    add_column :artists, :provider, :string
    add_column :artists, :uid, :string
    add_column :artists, :token, :string
    add_column :artists, :token_expiry, :datetime
  end
end
