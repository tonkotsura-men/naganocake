class Admins::OrderDetailsController < ApplicationController
	
		  before_action :authenticate_admin!

  def update
  		@order_detail = OrderDetail.find(params[:order_id])
  		@order = Order.find(params[:id])
  		@order_details = @order.order_details
		  if @order_detail.update(order_detail_params)
		  	flash[:success] = "制作ステータスを変更しました"
		    redirect_to admins_orders_path(@order_detail.order)
		  else
		    render "admins/orders/show"
		  end
  end

  private
  def order_detail_params
		  params.require(:order_detail).permit(:making_status)
	end

end

	