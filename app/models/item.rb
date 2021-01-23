class Item < ApplicationRecord
  has_many :order_items
  has_many :cart_items
  belongs_to :genre

  validates :name, uniqueness: true
  validates :genre_id, :name, :detail, :image_id, :price, :is_sold, presence: true
  attachment :image
end
