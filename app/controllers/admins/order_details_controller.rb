class Admins::OrderDetailsController < ApplicationController
	
		  before_action :authenticate_admin!

  def update
  		@order_detail = OrderDetail.find(params[:order_id])
  		@order = Order.find(params[:id])
  		@order_details = @order.order_details
		  if @order_detail.update(order_detail_params)
		  	 flash[:success] = "製造ステータスを変更しました"
		  	 redirect_to admins_order_path(@order_detail.order)
		  	if @order_detail.making_status == "製作中"
         	 @order.update(status: "製作中")
		    elsif
		    	@order_detail.making_status == "製作完了"
         	@order.update(status: "発送準備中")
      	end
		  else
		    render "admins/orders/show"
		  end
  end

  private
  def order_detail_params
		  params.require(:order_detail).permit(:making_status)
	end

end