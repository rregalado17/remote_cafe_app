class Cafe < ApplicationRecord
    belongs_to :user 
    has_many :reviews
    has_one_attached :cover
    validates :title, :description, :longitude, :latitude, presence: true
    scope :recent, -> { order(created_at: :desc).limit(10) }
end
