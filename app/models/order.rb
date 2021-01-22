class Order < ApplicationRecord
    validates :customer_id, :payment_method, :status, :address, :postal_code,
              :name, :shipping_cost, :total_price, presence: true
    belongs_to :customer
    has_many :order_items
    Order.all.sum(:subtotal)
end
