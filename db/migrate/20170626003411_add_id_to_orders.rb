class AddIdToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :id_appointment, :integer
  end
end
