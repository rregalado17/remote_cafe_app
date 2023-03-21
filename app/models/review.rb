class Review < ApplicationRecord
  belongs_to :user
  belongs_to :cafe
  scope :recent, -> { order(created_at: :desc).limit(10) }
end
