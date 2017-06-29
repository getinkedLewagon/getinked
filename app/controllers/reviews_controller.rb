class ReviewsController < ApplicationController
  def new
    @artist = Artist.find(params[:artist_id])
    @review = Review.new
  end

  def create
    @artist = Artist.find(params[:artist_id])
    @review = Review.new(clean_review_params)
    @review.artist = Artist.find(params[:artist_id])
    if @review.save
      redirect_to artist_path(@artist)
    else
      render :new
    end

  end


  private

  def clean_review_params
    results = review_params
    results["rating"] = results["rating"].to_i
    results
  end

  def avg_rating
    @artist = Artist.find(params[:artist_id])
    ratings = []
    @artist.reviews.each do |review|
      ratings << review.rating
    end

    @avg_rating = (ratings.inject(:+)/ratings.count).to_i
    @artist.rating = @avg_rating
    @artist.save
  end

  def review_params
    params.require(:review).permit(:description, :rating)
  end
end
