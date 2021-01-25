class Order < ApplicationRecord
    belongs_to :customer
    has_many :order_items
    attachment :image
    enum status: { "入金待ち": 0, "入金確認": 1, "製作中": 2, "発送準備中": 3, "発送済み": 4 }
    validates :customer_id, :payment_method, :status, :address, :postal_code,
              :name, :shipping_cost, :total_price, presence: true
    enum address_option: { "ご自身の住所": 0, "登録済住所から選択": 1, "新しいお届け先": 2,}

end
