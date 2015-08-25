class User < ActiveRecord::Base
  has_secure_password
  has_many :tasks, dependent: :destroy

  validates :username, presence: true
  validates :password, length: { minimum: 6 }
end
