class CartItem < ApplicationRecord
  validates :customer_id, :item_id, :count, presence: true
  belongs_to :customer
  belongs_to :item
end
