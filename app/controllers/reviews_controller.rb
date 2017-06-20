class ReviewsController < ApplicationController
  def new
    @appointment = Appointment.find(params[:appointment_id])
    @review = Review.new
  end

  def create
    @review = review.new(review_params)
    @review.appointment = Appointment.find(params[:appointment_id])
    if @review.save
      redirect_to artists_path(@artist.find(params[:id]))
    else
      render :new
    end

  end


  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
