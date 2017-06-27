class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
    @addresses = Artist.all.map {|a| a.city}.uniq
    # @artist = Artist.first
    @artists = Artist.all
    @cities = get_cities
    @styles = ["Choose a style", "Traditional", "Watercolor", "Realism", "Tribal", "New School", "Neo Traditional", "Japanese", "Dotwork", "Geometric", "Script", "Illustrative"]
  end

  def dashboard
    @addresses = Artist.all.map {|a| a.address}.uniq
    if current_user
      @appointments = current_user.appointments
    else
      @appointments = current_artist.appointments
    end
  end

  def edit_profile
    @styles = Style.all
    @artist = current_artist
    @bio = current_artist.info
  end


  private

  def get_cities
    @cities = ["Choose a city"]
    @artists.each do |artist|
      @cities << artist.city
    end
    @cities.uniq
  end
end
