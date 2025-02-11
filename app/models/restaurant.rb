class Restaurant < ApplicationRecord
  # associations
  # validations
  # validates :column_name, valiation...
  validates :name, presence: true
end
