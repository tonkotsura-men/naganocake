class Item < ApplicationRecord

	belongs_to :genre
	has_many :cart_items
	has_many :orders, through: :order_details
	has_many :order_details

	attachment :image

	#バリデーション記述
	validates :name, presence: true, length: {maximum:30,minimum:2}
	validates :introduction, presence: true, length: {maximum:250,minimum:2}
	validates :price, presence: true
	
	def posted_by?(customer)
		cart_items.where(customer_id: customer.id).exists?
	end

	def Item.search(search)
		if search
			Item.where(['name LIKE ?', "%#{search}%"])
		else
			Item.none
		end
	end

	
end
