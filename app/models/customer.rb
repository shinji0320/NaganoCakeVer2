class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, :kana_first_name, :kana_last_name, :postal_code,
            :address, :telephone_number, presence: true
  validates :is_deleted, inclusion:{in: [true, false]}
  has_many :orders
  has_many :cart_items

  def active_for_authentication?
    super && (self.is_deleted == false)
  end

end
