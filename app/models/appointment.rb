class Appointment < ApplicationRecord
  belongs_to :user
  # belongs_to :artist

  has_one :review
  has_many :messages
end
