class Publics::ItemsController < ApplicationController
  def index
  	@genres = Genre.where(is_active: true).page(params[:page]).per(10)
  	@items = Item.where(is_active: true).page(params[:page]).per(10)
  	unless params[:search] == nil
  		@item_title = Genre.find(params[:search]).name+"一覧"
      @items = Item.where(genre_id: params[:search])
  	else
  		@item_title = "商品一覧"
      @items = Item.where(is_active: true).page(params[:page]).per(10)
  	end
  end

  def show
  	@genres = Genre.where(is_active: true)
  	@item = Item.find(params[:id])
  	@cart_item = @item.cart_items.build
  end

end
