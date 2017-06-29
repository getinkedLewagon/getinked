class ArtistsController < ApplicationController
  skip_before_action :authenticate_user!

  #before_validation :authenticate_user!, only: [:artist_appointment]

  def index

    @artists = Artist.all

     @l_array = ["Choose a city"]
     @artists.each do |artist|
     @l_array << artist.city
    end
     @l_array = @l_array.uniq
     @styles = ["Choose a style", "Traditional", "Watercolor", "Realism", "Tribal", "New School", "Neo Traditional", "Japanese", "Dotwork", "Geometric", "Script", "Illustrative"]


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
    pictures = params[:select_pictures].reject(&:empty?)

    current_artist.photos.destroy_all

    pictures.each do |pic|
      photo = Photo.new(url: pic)
      photo.artist = current_artist
      photo.save
    end

    redirect_to dashboard_path
  end

  def update
    @artist = Artist.find(params[:id])
    @artist.email = update_params[:email]
    @artist.address = update_params["address"]
    @artist.city = update_params["city"]
    @artist.info = update_params["info"]

    @artist.artist_styles.destroy_all

    update_params["styles"].each do |style_id|
      ArtistStyle.create(style_id: style_id, artist_id: @artist.id)
      # @artist.artist_styles.create(style_id: style_id)
    end

    # @artist.styles = update_params["styles"]
    @artist.save
    redirect_to dashboard_path
  end



  private

  def update_params
     params.require(:artist).permit!
  end

  def upload_params
    params.require(:select_pictures).permit!
  end


end

