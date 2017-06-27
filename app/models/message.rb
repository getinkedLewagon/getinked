class Message < ApplicationRecord
  belongs_to :artist
  belongs_to :user
  belongs_to :chatroom

  validates :content, presence: true, allow_blank: false
end
