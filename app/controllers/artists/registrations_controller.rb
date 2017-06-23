class Artists::RegistrationsController < Devise::RegistrationsController


  def new
    @styles = Style.all
    super
  end

  def create

    super
    @styles = params[:artist][:style]
    @styles.delete_at(0)
    @styles.each do |style|
      style_m = Style.find(style)
      ArtistStyle.create(artist: current_artist, style: style_m)
    end

  end

end
