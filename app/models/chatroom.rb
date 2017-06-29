class Chatroom < ApplicationRecord
  has_many :messages , dependent: :destroy

  has_one :user
  has_one :artist

  belongs_to :appointment
end
