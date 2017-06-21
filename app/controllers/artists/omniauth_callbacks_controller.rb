class Artists::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def instagram
    artist = Artist.find_for_instagram_oauth(request.env['omniauth.auth'])

    if artist.persisted?
      sign_in_and_redirect artist, event: :authentication
      # set_flash_message(:notice, :success, kind: 'Facebook') if is_navigational_format?
    else
      session['devise.instagram_data'] = request.env['omniauth.auth']
      redirect_to new_artist_registration_url
    end
  end
end
