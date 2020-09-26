class Publics::AddressesController < ApplicationController

  before_action :set_address, only:[:edit, :update, :destroy]


  def index
    @address = Address.new
    @customer = current_customer
  end

  def edit
    # @address = Address.find(params[:id])
  end

  def create
    
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    @address.save
    redirect_to addresses_path
  end

  def update
    # @address = Address.find(params[:id])
    @address.update(address_params)
    redirect_to addresses_path
  end

  def destroy
    # @address = Address.find(params[:id])
    @address.destroy
    redirect_to addresses_path
  end

  private
  def address_params
    params.require(:address).permit(:postal_code, :address, :name)
  end

  def set_address
    @address = Address.find(params[:id])
  end  

end
