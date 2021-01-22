class OrderItem < ApplicationRecord
  validates :item_id, :order_id, :count, :making_status, :purchased_price, presence: true
  belongs_to :order
  belongs_to :item
end
