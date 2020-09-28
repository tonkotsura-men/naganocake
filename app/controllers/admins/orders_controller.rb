class Admins::OrdersController < ApplicationController
  include ApplicationHelper

  before_action :set_order, only: [:show, :update]

  def index
  	@orders = Order.all.page(params[:page]).per(10)
  end

  def show
  	# @order = Order.find(params[:id])
  	@order_details = @order.order_details
  end

  def update
  	# @order = Order.find(params[:id])
    @order_details = @order.order_details
  	if @order.update(order_params)
       redirect_to admins_orders_path
        @order_details.each do |order_detail|
        if @order.status == "入金確認"
            order_detail.update(making_status: "製作待ち")
        elsif
          @order.status == "発送済み"
          @order.update(status: "発送済み")
        end
      end
  	else
  		render "admins/orders/show"
  	end
  end


  private
 	def order_params
		  params.require(:order).permit(:status)
	end

  def set_order
    @order = Order.find(params[:id])
  end

end
