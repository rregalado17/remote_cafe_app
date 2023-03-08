class User < ApplicationRecord
  has_many :reviews 
  validates :email, :username, presence: true, uniqueness: true 
  has_secure_password
end


