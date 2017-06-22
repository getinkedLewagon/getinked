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
    @artist_coordinates = { lat: @artist.latitude, lng: @artist.longitude }

    @artists = Artist.where.not(latitude: nil, longitude: nil)

    @hash = Gmaps4rails.build_markers(@artist) do |artist, marker|
      marker.lat artist.latitude
      marker.lng artist.longitude
    end


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

