class AddSkuToAppointments < ActiveRecord::Migration[5.0]
  def change
    add_column :appointments, :sku, :string
  end
end
