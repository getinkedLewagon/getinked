class AddAppointmentIdToReviews < ActiveRecord::Migration[5.0]
  def change
    add_reference :reviews, :appointment, foreign_key: true
  end
end
