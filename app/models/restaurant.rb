class Restaurant < ApplicationRecord
  # associations
  # dependent destroy is ONLY on the has_many
  has_many :reviews, dependent: :destroy # creates a method (restaurant.reviews)
  # validations
  # validates :column_name, valiation...
  validates :name, presence: true
  validates :address, presence: true
end
