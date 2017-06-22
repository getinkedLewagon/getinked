class CreateAvailabilities < ActiveRecord::Migration[5.0]
  def change
    create_table :availabilities do |t|
      t.references :artist, foreign_key: true
      t.string :day
      t.string :start_time
      t.string :end_time

      t.timestamps
    end
  end
end
