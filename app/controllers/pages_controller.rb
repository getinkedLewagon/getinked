class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @artist = Artist.find(params[:id])
    @locations = Artist.all.map {|a| a.location}.uniq
  end

  def dashboard
    @locations = Artist.all.map {|a| a.location}.uniq
    if current_user
      @appointments = current_user.appointments
    else
      @appointments = current_artist.appointments
    end
    @locations = Artist.all.map {|a| a.address}.uniq
  end

  def dashboard
    @locations = Artist.all.map {|a| a.address}.uniq
    @appointments = current_user.appointments
  end
end
