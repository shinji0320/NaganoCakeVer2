class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item
  validates :customer_id, :item_id, :count, presence: true

  def price_with_tax(price)
    return (item_price * tax).to_i
  end
end
