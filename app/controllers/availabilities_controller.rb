class AvailabilitiesController < ApplicationController
    skip_before_action :authenticate_user!


  def new
    @availability = Availability.new
    @hours = ["00:00", "01:00", "02:00", "03:00", "04:00", "05:00", "06:00", "07:00", "08:00", "09:00", "10:00", "11:00", "12:00", "13:00", "14:00", "15:00", "16:00", "17:00", "18:00", "19:00", "20:00", "21:00", "22:00", "23:00"]
    @days = ["sunday", "monday", "tuesday", "wednesay", "thursday", "friday", "saturday"]
  end

  def create
    @availability = Availability.new(availability_params)
    @availability.artist_id = current_artist.id
    if @availability.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def availability_params
    params.require(:availability).permit(:day, :start_time, :end_time)
  end
end
