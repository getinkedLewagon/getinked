class Artist < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :omniauthable, :validatable

  has_many :reviews
  has_many :photos
  has_many :styles, through: :artist_styles
  has_many :appointments
  has_many :messages
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

  private

  def check_email
    super(User)
  end
end
