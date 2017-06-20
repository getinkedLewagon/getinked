class CreateArtistStyles < ActiveRecord::Migration[5.0]
  def change
    create_table :artist_styles do |t|
      t.references :styles, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
