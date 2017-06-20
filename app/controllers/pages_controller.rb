class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @locations = Artist.all.map {|a| a.location}.uniq
  end

  def dashboard
    @locations = Artist.all.map {|a| a.location}.uniq
    @appointments = current_user.appointments
  end

end
