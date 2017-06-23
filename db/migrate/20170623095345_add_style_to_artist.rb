class AddStyleToArtist < ActiveRecord::Migration[5.0]
  def change
    change_table :artists do |t|
      add_column :artists, :style, :string
    end
  end
end
