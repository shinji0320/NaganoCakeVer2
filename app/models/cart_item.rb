class CartItem < ApplicationRecord
  validates :customer_id, :item_id, :count, presence: true
end
