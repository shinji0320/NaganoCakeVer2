class Item < ApplicationRecord
  validates :name, uniqueness: true
  validates :genre_id, :name, :detail, :image_id, :price, :is_sold, presence: true
  attachment :image
end
