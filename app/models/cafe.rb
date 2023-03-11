class Cafe < ApplicationRecord
    belongs_to :user 
    has_many :reviews
    validates :title, :description, :longitude, :latitude, presence: true
end
