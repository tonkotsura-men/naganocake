class Publics::ItemsController < ApplicationController
  def index
  	@genres = Genre.where(is_active: true)
  	@items = Item.where(is_active: true).page(params[:page]).per(8).reverse_order
  end

  def show
  	@genres = Genre.where(is_active: true)
  	@item = Item.find(params[:id])
  	@cart_item = CartItem.new
  end
end
