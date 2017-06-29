class PhotosController < ApplicationController
  skip_before_action :authenticate_user!
  def show
    @photo = Photo.find(params[:id])
  end
end
