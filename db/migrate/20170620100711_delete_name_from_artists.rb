class DeleteNameFromArtists < ActiveRecord::Migration[5.0]
  def change
    remove_column :artists, :name

  end
end
