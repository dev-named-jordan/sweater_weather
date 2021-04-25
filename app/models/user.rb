class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  validates :email, presence: true
  validates :password, confirmation: true
  validates :password, require: true
  validates :api_key, presence: true

  has_secure_password
end
