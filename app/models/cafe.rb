class Cafe < ApplicationRecord
    has_many :reviews, through: :users
end
