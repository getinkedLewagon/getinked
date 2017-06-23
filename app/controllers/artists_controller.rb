class ArtistsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @artists = Artist.all
    #@cities = Artist.all.map { |a| a.city }.uniq
     @l_array = []
     @artists.each do |artist|
      @l_array << artist.city
    end
    @l_array = @l_array.uniq
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

    p @hash

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

  def update
    @artist = Artist.find(params[:id])
    @artist.email = update_params["email"]
    @artist.address = update_params["address"]
    @artist.city = update_params["city"]
    @artist.info = update_params["info"]
    @artist.save
    redirect_to dashboard_path
  end



  private

  def update_params
    params.require(:artist).permit(:email, :address, :city, :info)

  end

end

