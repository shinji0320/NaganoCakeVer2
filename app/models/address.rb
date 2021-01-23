class Address < ApplicationRecord
  belongs_to :customer
  validates :customer_id, :postal_code, :address, :name, presence: true
end
