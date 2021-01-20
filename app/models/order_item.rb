class OrderItem < ApplicationRecord
  validates :item_id, :order_id, :count, :making_status, :purchased_price, presence: true
end
