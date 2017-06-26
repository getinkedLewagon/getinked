class AddPriceToAppointments < ActiveRecord::Migration[5.0]
  def change
    add_monetize :appointments, :price, currency: { present: false }
  end
end
