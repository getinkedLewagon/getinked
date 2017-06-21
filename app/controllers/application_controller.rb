class ApplicationController < ActionController::Base
  include DateTimePicker

  protect_from_forgery with: :exception
  before_action :authenticate_user!
  protected

#   def after_sign_in_path_for(resource)

#     # return the path based on resource
#   end
end
