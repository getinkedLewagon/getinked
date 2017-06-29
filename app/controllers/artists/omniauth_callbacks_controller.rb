
class Artists::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def instagram
    artist = Artist.find_for_instagram_oauth(request.env['omniauth.auth'])

    if artist.persisted? && artist.photos.count == 0
      sign_in artist, event: :authentication
      redirect_to dashboard_url

       set_flash_message(:notice, :success, kind: 'Facebook') if is_navigational_format?
     elsif artist.persisted?
       sign_in artist, event: :authentication
       redirect_to dashboard_url
     else
       session['devise.instagram_data'] = request.env['omniauth.auth']
       redirect_to dashboard_url
    end
  end
end
