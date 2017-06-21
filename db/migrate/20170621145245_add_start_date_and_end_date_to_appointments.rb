class AddStartDateAndEndDateToAppointments < ActiveRecord::Migration[5.0]
  def change
    add_column :appointments, :start_time, :string
    add_column :appointments, :end_time, :string
  end
end
