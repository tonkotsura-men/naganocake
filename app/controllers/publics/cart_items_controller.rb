class Publics::CartItemsController < ApplicationController
  include ApplicationHelper

  before_action :authenticate_customer!
  before_action :set_cart_item, only: [:update, :destroy, :edit]
  before_action :set_customer

  def index
    @cart_items = @customer.cart_items
  end

  def update
    @cart_item.update(amount: params[:cart_item][:amount].to_i)
    flash.now[:success] = "#{@cart_item.item.name}の数量を変更しました"
    @price = sub_price(@cart_item).to_s(:delimited)
    @cart_items = @customer.cart_items
    @total = total_price(@cart_items).to_s(:delimited)
    redirect_to cart_items_path
  end

  def destroy
    @cart_item.destroy
    flash.now[:alert] = "#{@cart_item.item.name}を削除しました"
    @cart_items = @customer.cart_items
    @total = total_price(@cart_items).to_s(:delimited)
    redirect_to cart_items_path
  end

  def destroy_all
    #カート内商品全消去
    @customer.cart_items.destroy_all
    redirect_to cart_items_path
    flash[:info] = 'カートを空にしました。'
  end

  def create
    @cart_item = current_customer.cart_items.new(cart_item_params)
    item = Item.find(params[:cart_item][:item_id])
    # カートに同じ商品がなければ新規追加、あれば既存のデータと合算
    unless item.posted_by?(current_customer)
      if @cart_item.save
        flash[:success] = 'カートに商品が追加されました！'
        redirect_to cart_items_path
      else
        @cart_items = @customer.cart_items.all
        render 'index'
        flash[:danger] = 'カートに商品を追加できませんでした。'
      end
    else
      @current_item = CartItem.find_by(item_id: params[:cart_item][:item_id], customer_id: current_customer.id)
      @current_item.update(amount: @current_item.amount+@cart_item.amount)
      redirect_to cart_items_path
    end
  end


  private

  def set_customer
    @customer = current_customer
  end

  def set_cart_item
    @cart_item = CartItem.find(params[:id])
  end

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end

end
