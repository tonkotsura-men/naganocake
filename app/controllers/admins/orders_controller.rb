class Admins::OrdersController < ApplicationController

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
  	if @order.update(order_params)
  		redirect_to admins_order_path(@order)	
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
