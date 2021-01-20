class Address < ApplicationRecord
  validates :customer_id, :postal_code, :address, :name, presence: true
end
