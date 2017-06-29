class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  def home
    puts 'Home Page'
    @addresses = Artist.all.map {|a| a.city}.uniq
    @artist = Artist.first
    @artists = Artist.all
    @cities = get_cities
    @styles = ["Choose a style", "Traditional", "Watercolor", "Realism", "Tribal", "New School", "Neo Traditional", "Japanese", "Dotwork", "Geometric", "Script", "Illustrative"]
  end

  def dashboard
    check_kind_user
    @addresses = Artist.all.map {|a| a.address}.uniq
    if current_user
      @appointments = current_user.appointments
    elsif current_artist
      @appointments = current_artist.appointments
    end

  end

  def edit_profile
    if current_artist
      @styles = Style.all
      @artist = current_artist
      @bio = current_artist.info
    else
      redirect_to root_path
    end
  end


  private
  def check_kind_user
    unless current_user || current_artist
      redirect_to root_path
    end
  end
  def get_cities
    @cities = ["Choose a city"]
    @artists.each do |artist|
    @cities << artist.city
    end
    @cities.uniq
  end
end
