class ApplicationController < ActionController::Base
  include DateTimePicker

  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?


  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :address, :info, :city, :username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
#   def after_sign_in_path_for(resource)
#
#     # return the path based on resource
#   end
end
