class AddSketchToAppointment < ActiveRecord::Migration[5.0]
  def change
    add_column :appointments, :sketch, :string
  end
end
