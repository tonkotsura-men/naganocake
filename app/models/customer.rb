class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

  has_many :cart_items, dependent: :destroy
  has_many :items, through: :cart_items

  has_many :orders
  has_many :addresses

  validates :first_name, :last_name, :first_name_kana, :last_name_kana,
            :address, :telephone_number,
            presence: true
  validates :postal_code, length: {is: 7}, numericality: { only_integer: true }
  validates :telephone_number, numericality: { only_integer: true }
  validates :first_name_kana, :last_name_kana,
      format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: "カタカナで入力して下さい。"}
  validates :email, presence: true, uniqueness: true
  #paranoaia
  acts_as_paranoid


  

end
