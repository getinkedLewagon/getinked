class ArtistsController < ApplicationController
   skip_before_action :authenticate_user!, only: [:index,:show]
  def index
    @artists = Artist.all
    #@cities = Artist.all.map { |a| a.city }.uniq
     @l_array = ["Barcelona", "Rome"]
  end

  def show
    @artist = Artist.find(params[:id])
    @appointment = Appointment.new
  end

  def artist_dashboard
  end
end
