class Artist < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable,
  :omniauthable, omniauth_providers: [:instagram]

  has_many :reviews , dependent: :destroy
  has_many :photos
  has_many :styles, through: :artist_styles
  has_many :artist_styles
  has_many :appointments, dependent: :destroy
  has_many :messages
  has_many :chatrooms, through: :messages
  has_many :availabilities, dependent: :destroy

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
      artist.info = artist.extract_from_instagram[:artist_bio]
      artist.avatar = artist.extract_from_instagram[:avatar_image]
      artist.name = artist.extract_from_instagram[:artist_name]
      artist.email = "#{artist_params['uid']}@instagram.com"
      artist.save
    end

    return artist
  end

  # All Instagram related methods come over here

  def extract_from_instagram
    return @_extract_from_instagram if defined?(@_extract_from_instagram)
    result = {}
    url = "https://api.instagram.com/v1/users/self/?access_token=#{self.token}"
    parse = JSON.parse(open(url).read)
    result[:artist_name] = artist_name(parse)
    result[:artist_bio] = artist_bio(parse)
    result[:avatar_image] = avatar_image(parse)
    result[:raw] = parse
    @_extract_from_instagram = result
  end
  def recent_media
    extract_recent_media
  end

  def name
    return super if super.present?
    self.email.split("@").first
  end

  def artist_name(parse)
  # fetches instagram user name from instagram
    parse["data"]["username"]
  end

  def artist_bio(parse)
    parse["data"]["bio"]
  end

  def image
    extract_from_instagram[:avatar_image]
  end

  def bio
    extract_from_instagram[:bio]
  end

  def avatar_image(parse)
  # fetches artist's profile picture from instagram
    parse["data"]["profile_picture"]
  end

  def extract_recent_media
  #fetches artist_'s recent media from instagram
    unless self.token.nil?
      url = "https://api.instagram.com/v1/users/self/media/recent/?access_token=#{self.token}"

      parse = JSON.parse(open(url).read)
      parse["data"]
    end
  # append ["images"]["low_resolution"]["url"] in view to get image url
  end

  def followers
    extract_from_instagram[:raw]["data"]["counts"]["followed_by"]
  end




  def check_email
    super(User)
  end
end
