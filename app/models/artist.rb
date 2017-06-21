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

  private

  def check_email
    super(User)
  end
end
