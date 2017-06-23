class FixSketchName < ActiveRecord::Migration[5.0]
  def change
   rename_column :appointments, :sketch, :photo
  end
end
