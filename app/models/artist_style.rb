class ArtistStyle < ApplicationRecord
  belongs_to :styles
  belongs_to :user
end
