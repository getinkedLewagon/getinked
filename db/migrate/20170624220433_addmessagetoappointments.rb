class Addmessagetoappointments < ActiveRecord::Migration[5.0]
  def change
    add_column :appointments, :message, :text
  end
end
