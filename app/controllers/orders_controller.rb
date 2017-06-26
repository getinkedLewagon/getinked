class OrdersController < ApplicationController
  def create
  @appointment = Appointment.find(params[:appointment_id])
  order  = Order.create!(appointment_sku: @appointment.sku, amount: @appointment.price, state: 'pending', id_appointment: params[:appointment_id])

  redirect_to new_order_payment_path(order)
  end


end
