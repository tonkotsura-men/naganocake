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
    if @customer.update(customer_params)
      redirect_to customers_path, success: 'お客様情報が更新されました！'
    else
      flash[:danger] = 'お客様の情報を更新出来ませんでした。空欄の箇所はありませんか？'
      render :edit
    end
  end

  def withdraw
    current_customer.destroy
    reset_session
    redirect_to top_path, info: 'ありがとうございました。またのご利用を心よりお待ちしております。'
  end

  private

  def customer_params
    params.require(:customer).permit(:first_name, :first_name_kana, :last_name, :last_name_kana, :postal_code, :address, :email, :telephone_number)
  end

  def set_customer
    @customer = current_customer
  end

end
