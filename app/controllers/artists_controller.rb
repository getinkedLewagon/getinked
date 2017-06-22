class ArtistsController < ApplicationController
   skip_before_action :authenticate_user!, only: [:index,:show,:upload]
  def index
    @artists = Artist.all
    #@cities = Artist.all.map { |a| a.city }.uniq
     @l_array = ["Barcelona", "Rome"]
  end

  def show
    @artist = Artist.find(params[:id])
    @appointment = Appointment.new
  end

  def upload
    pictures = params[:select_pictures][:pictures_url].reject(&:empty?)
    pictures.each do |pic|
      photo = Photo.new(url: pic)
      photo.artist = current_artist
      photo.save
    end
    redirect_to root_path

  end

  end

