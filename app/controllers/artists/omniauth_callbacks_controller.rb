class Artists::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def instagram
    artist = Artist.find_for_instagram_oauth(request.env['omniauth.auth'])

    if artist.persisted?
      sign_in artist, event: :authentication
      raise
      # set_flash_message(:notice, :success, kind: 'Facebook') if is_navigational_format?
      redirect_to edit_artist_registration_path(artist)
    else
      session['devise.instagram_data'] = request.env['omniauth.auth']
      redirect_to new_artist_registration_url
    end
  end
end
