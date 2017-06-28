class Appointment < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  monetize :price_cents

  belongs_to :user
  belongs_to :artist

  has_one :chatroom ,depdent: :destroy
  has_one :review, depdent: :destroy

  def status_confirmed
    self.status = "confirmed"
    self.save
  end

  def status_denied
    self.status = "denied"
    self.save
  end
end
