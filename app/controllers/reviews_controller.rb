class ReviewsController < ApplicationController
  def new
    @artist = Artist.find(params[:artist_id])
    @review = Review.new
  end

  def create
    @artist = Artist.find(params[:artist_id])
    @review = Review.new(review_params)
    @review.artist = Artist.find(params[:artist_id])
    if @review.save
      redirect_to artist_path(@artist)
    else
      render :new
    end

  end


  private

  def review_params
    params.require(:review).permit(:description, :rating)
  end
end
