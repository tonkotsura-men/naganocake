class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

  has_many :cart_items
  has_many :items, through: :cart_items

  has_many :orders
  has_many :addresses

  validates :email, length: {minimum: 3, maximum: 80}
  validates :last_name, length: {minimum: 1, maximum: 15}
  validates :last_name_kana, length: {minimum: 1, maximum: 20}
  validates :first_name, length: {minimum: 1, maximum: 15}
  validates :first_name_kana, length: {minimum: 2, maximum: 20}
  validates :postal_code, length: {minimum: 3, maximum: 10}
  validates :address, length: {minimum: 3, maximum: 50}
  validates :telephone_number, length: {minimum: 3, maximum: 15}

end
