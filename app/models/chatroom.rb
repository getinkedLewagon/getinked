class Chatroom < ApplicationRecord
  has_many :messages

  has_one :user
  has_one :artist

  belongs_to :appointment
end
