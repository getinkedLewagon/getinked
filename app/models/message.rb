class Message < ApplicationRecord
  belongs_to :appointments
  belongs_to :user
end
