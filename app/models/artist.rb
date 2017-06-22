class Artist < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable,
  :omniauthable, omniauth_providers: [:instagram]

  has_many :reviews
  has_many :photos
  has_many :styles, through: :artist_styles
  has_many :appointments
  has_many :messages
  has_many :availabilities
  before_validation :check_email

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

  private

  def check_email
    super(User)
  end
end
