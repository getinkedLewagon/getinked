class Style < ApplicationRecord
  has_many :artists, through: :artist_styles
end
