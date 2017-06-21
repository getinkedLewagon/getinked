class AddFieldsToAppointments < ActiveRecord::Migration[5.0]
  def change
    change_table :appointments do |t|
      t.remove :start_time
      t.remove :end_time
    end

  end
end
