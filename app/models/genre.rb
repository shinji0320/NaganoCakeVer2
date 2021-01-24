class Genre < ApplicationRecord
  #validates :name, :is_valid, presence: true
  has_many :items
  validates :name, uniqueness: true
end
