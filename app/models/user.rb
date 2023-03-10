class User < ApplicationRecord
  has_many :reviews
  has_many :cafes, through: :reviews 
  validates :email, :username, presence: true, uniqueness: true 
  validates :email, :username, length: { minimum: 3, message: "Must be at least 3 characters." } 
  has_secure_password
end


