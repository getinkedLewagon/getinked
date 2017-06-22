class Artist < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable,
  :omniauthable, omniauth_providers: [:instagram]

  has_many :reviews
  has_many :photos
  has_many :styles, through: :artist_styles
  has_many :appointments, dependent: :destroy
  has_many :messages
  has_many :availabilities
  before_validation :check_email


  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  def business_hours(day_off, start_time, end_time)

    Biz::Schedule.new do |config|

      config.hours = {
        mon: {start_time => end_time},
        tue: {start_time => end_time},
        wed: {start_time => end_time},
        thu: {start_time => end_time},
        fri: {start_time => end_time},
        sat: {start_time => end_time},
        sun: {start_time => end_time}
      }

      config.hours.delete(day_off)
    end
  end


  def self.find_for_instagram_oauth(auth)
    artist_params = auth.slice(:provider, :uid)
    # artist_params.merge! auth.info.slice(:email)
    artist_params[:token] = auth.credentials.token
    # artist_params[:token_expiry] = Time.at(auth.credentials.expires_at)
    artist_params = artist_params.to_h

    artist = Artist.find_by(provider: auth.provider, uid: auth.uid)
    # artist ||= Artist.find_by(email: auth.info.email) # User did a regular sign up in the past.

    if artist
      artist.update(artist_params)
    else
      artist = Artist.new(artist_params)
      artist.password = Devise.friendly_token[0,20]  # Fake password for validation
      artist.save
    end

    return artist
  end

  # All Instagram related methods come over here

  def extract_from_instagram
    result = {}
    url = "https://api.instagram.com/v1/users/self/?access_token=#{"2903877096.988f7c8.15ad9ca4f6d94cad901f8836f68b1822"}"
    parse = JSON.parse(open(url).read)
    result[:artist_name] = artist_name(parse)
    result[:artist_bio] = artist_bio(parse)
    result[:avatar_image] = avatar_image(parse)
    result[:followers] = followers(parse)
    result
  end
  def recent_media
    extract_recent_media
  end

  private
  def artist_name(parse)
  # fetches instagram user name from instagram
    parse["data"]["username"]
  end

  def artist_bio(parse)
    parse["data"]["bio"]
  end

  def avatar_image(parse)
  # fetches artist's profile picture from instagram
    parse["data"]["profile_picture"]
  end

  def extract_recent_media
  #fetches artist_'s recent media from instagram
  url = "https://api.instagram.com/v1/users/self/media/recent/?access_token=#{"2903877096.988f7c8.15ad9ca4f6d94cad901f8836f68b1822"}"

  parse = JSON.parse(open(url).read)
  parse["data"]
  # append ["images"]["low_resolution"]["url"] in view to get image url
  end

  def followers(parse)
  # fetches artist's profile picture from instagram
    parse["data"]["counts"]["followed_by"]
  end




  def check_email
    super(User)
  end
end
