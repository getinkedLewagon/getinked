class AddScheduleToArtists < ActiveRecord::Migration[5.0]
  def change
   change_table :reviews do |t|
    add_column :artists, :schedule, :string
  end
end
end
