class Genre < ApplicationRecord
  # validates :name, :is_valid, presence: true
  validates :name, uniqueness: true
  has_many :items
end
