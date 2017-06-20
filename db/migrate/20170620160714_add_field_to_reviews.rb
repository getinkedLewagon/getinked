class AddFieldToReviews < ActiveRecord::Migration[5.0]
  def change
    change_table :reviews do |t|
      t.remove :appointments_id
      t.references :artist, foreign_key: true
    end

  end
end
