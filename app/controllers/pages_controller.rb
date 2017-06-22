class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  def home
    @addresses = Artist.all.map {|a| a.city}.uniq
    @artist = Artist.first


  end

  def dashboard
    @addresses = Artist.all.map {|a| a.address}.uniq
    # @artist = Artist.find(params[:id]
    if current_user
      @appointments = current_user.appointments
    else
      @appointments = current_artist.appointments
    end
  end

  end

