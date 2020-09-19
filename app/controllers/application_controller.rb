class ApplicationController < ActionController::Base
  
	before_action :configure_permitted_parameters, if: :devise_controller?

  #Bootstrapのflashメッセージ機能追記
  add_flash_types :success, :danger, :info

	protected

    # ログアウト時のパスの変更
    def after_sign_out_path_for(resource)
      root_path
    end

    # 新規登録の保存機能
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :telephone_number])

      #sign_upの際にnameのデータ操作を許。追加したカラム。
  		devise_parameter_sanitizer.permit(:sign_in, keys: [:email])

    end

  	private

  	# before_action作成

  	def set_item
    	@item = Item.find(params[:id])
  	end

	end

