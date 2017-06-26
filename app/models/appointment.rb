class Appointment < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  belongs_to :user
  belongs_to :artist

  has_one :chatroom
end
