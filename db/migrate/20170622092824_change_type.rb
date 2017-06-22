class ChangeType < ActiveRecord::Migration[5.0]
  def change
    rename_column :messages, :appointments_id, :appointment_id
  end
end
