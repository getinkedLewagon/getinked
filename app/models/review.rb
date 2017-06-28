class Review < ApplicationRecord
  belongs_to :artist
  validates :rating, presence: true
  after_save :update_artist_rating, if: :rating_changed?

  def update_artist_rating
    all_ratings = self.artist.reviews.reduce(0) { |a, r| a + r.rating }
    self.artist.rating = all_ratings / self.artist.reviews.length.to_f
    self.artist.save
  end

end
