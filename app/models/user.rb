class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :appointments, dependent: :destroy
  has_many :messages, dependent: :destroy
  before_validation :check_email
  # stupid change for push

  private

  def check_email
    super(Artist)
  end
end
