class Admins::CustomersController < ApplicationController

	before_action :authenticate_admin!
  before_action :set_customer, only: [:show, :edit, :update]
  def index
    @customers = Customer.with_deleted
  end

  def show
    # @customer = Customer.find(params[:id])
  end

  def edit
    # @customer = Customer.find(params[:id])
  end

  def update
    # @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
       flash[:success] = "会員情報を変更しました"
       redirect_to admins_customers_path
    else
      render "edit"
    end
  end

  private
   def customer_params
    params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :telephone_number, :email, :is_valid)
   end  

   def set_customer
     @customer = Customer.with_deleted.find(params[:id])
   end

end
