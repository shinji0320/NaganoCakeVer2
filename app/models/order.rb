class Order < ApplicationRecord
    belongs_to :customer
    has_many :order_items
    # Order.all.sum(:subtotal)
    enum status: { "入金待ち": 0, "入金確認": 1, "製作中": 2, "発送準備中": 3, "発送済み": 4 }
    validates :customer_id, :payment_method, :status, :address, :postal_code,
              :name, :shipping_cost, :total_price, presence: true
end
