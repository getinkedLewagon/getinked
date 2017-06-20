class Review < ApplicationRecord
  belongs_to :appointment
  has_one :artist, through: :appointment
end
