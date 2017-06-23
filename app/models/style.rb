class Style < ApplicationRecord
  has_many :artists, through: :artist_styles
  has_many :artist_styles
end
