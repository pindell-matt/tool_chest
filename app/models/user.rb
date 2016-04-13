class User < ActiveRecord::Base
  has_secure_password

  has_many :tools

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true

  enum role: %w(default admin)
end
