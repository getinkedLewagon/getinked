class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  before_action :prepare, only: [:dashboard, :create_message]

  def home
    @addresses = Artist.all.map {|a| a.city}.uniq
    # @artist = Artist.first
    @artists = Artist.all
    @cities = get_cities
    @styles = ["Traditional", "Watercolor", "Realism", "Tribal", "New School", "Neo Traditional", "Japanese", "Dotwork", "Geometric", "Script", "Illustrative"]
  end

  def dashboard
  end

  def create_message
    @content = params[:content]
    @appointment = params[:appointment].to_i
    @artist = params[:artist].to_i
    @user = params[:user].to_i

    @message = Message.new(content: @content, appointment_id: @appointment, artist_id: @artist,
     user_id: @user, from: params[:from])
    @message.save

    respond_to do |format|
      format.js
    end
  end

   def refresh
    prepare
     respond_to do |format|
  #     format.json{ render json: prepare, status: :ok}
      format.js
     end
   end


  def prepare
    @addresses = Artist.all.map {|a| a.address}.uniq
    @message = Message.new
    if current_user
      @appointments = current_user.appointments
    else
      @appointments = current_artist.appointments
    end
  end

  private

  def get_cities
    cities = []
    @artists.each do |artist|
      cities << artist.city
    end
    cities.uniq
  end

end
