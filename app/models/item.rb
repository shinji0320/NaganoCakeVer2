class Item < ApplicationRecord

  has_many :order_items
  has_many :cart_items
  belongs_to :genre
  attachment :image
  validates :name, uniqueness: true
  # validates :genre_id, :name, :detail, :image_id, :price, :is_sold, presence: true

  tax = 1.1

  def price_with_tax(price)
    return (item_price * tax).to_i
  end

end
