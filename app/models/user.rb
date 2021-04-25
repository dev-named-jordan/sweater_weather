class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  validates :password, confirmation: true
  validates :api_key, presence: true

  has_secure_password
end
