class AddFieldsToArtists < ActiveRecord::Migration[5.0]
  def change
    add_column :artists, :name, :string
    add_column :artists, :address, :string
    add_column :artists, :city, :string
    add_column :artists, :rating, :float
    add_column :artists, :start_fee, :integer
  end
end
