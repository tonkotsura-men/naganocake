class Publics::CustomersController < ApplicationController

  before_action :authenticate_customer!
  before_action :set_customer


  def show
  end

  def edit
  end

  def unsubscribe
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to customers_path, success: 'お客様情報が更新されました！'
    else
      flash[:danger] = 'お客様の情報を更新出来ませんでした。空欄の箇所はありませんか？'
      render :edit
    end
  end

  def withdraw
    @customer = current_customer
    @customer.update(is_deleted: false)
    reset_session
    redirect_to top_path, info: 'ありがとうございました。またのご利用を心よりお待ちしております。'
  end

  private

  def customer_params
    params.require(:customer).permit(:is_deleted, :first_name, :first_name_kana, :last_name, :last_name_kana, :postal_code, :address, :email, :telephone_number, cart_items_attributes: [:_destroy])
  end

  def set_customer
    @customer = current_customer
  end

end
