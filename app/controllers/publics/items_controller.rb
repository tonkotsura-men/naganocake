class Publics::ItemsController < ApplicationController
  def index
  	@genres = Genre.where(is_active: true).page(params[:page]).per(10)
  	@items = Item.where(is_active: true).page(params[:page]).per(9)
  	unless params[:search] == nil
  		@item_title = Genre.find(params[:search]).name+"一覧"
      @items = Item.where(genre_id: params[:search]).page(params[:page]).per(10)
  	else
  		@item_title = "商品一覧"
      @items = Item.where(is_active: true).page(params[:page]).per(9)
  	end
  end

  def show
  	@genres = Genre.where(is_active: true).page(params[:page]).per(10)
  	@item = Item.find(params[:id])
  	@cart_item = @item.cart_items.build
  end

end
