class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item
  validates :customer_id, :item_id, :count, presence: true
  
  def price_with_tax(price)
    tax = 1.1
    return ((price * tax).round(2)).ceil.to_i
  end

  def subtotal
    (price_with_tax * count).to_i
  end

end
