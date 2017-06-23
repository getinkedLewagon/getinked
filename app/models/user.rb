require 'socket'

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :appointments
  has_many :messages
  before_validation :check_email
  # stupid change for push


 def set_ip
  # uses Google's address to know own public IP address
    ip = UDPSocket.open {|s| s.connect("64.233.187.99", 1); s.addr.last}
    self.ip_address = ip
  end

  private



  def check_email
    super(Artist)
  end
end
