class Message < ApplicationRecord
  belongs_to :artist
  belongs_to :user
  belongs_to :appointment
end
