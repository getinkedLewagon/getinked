class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @addresses = Artist.all.map {|a| a.address}.uniq
  end

  def dashboard
    @addresses = Artist.all.map {|a| a.address}.uniq
    @appointments = current_user.appointments
    @artist = Artist.find(params[:id])
    if current_user
      @appointments = current_user.appointments
    else
      @appointments = current_artist.appointments
    end
  end

  end

