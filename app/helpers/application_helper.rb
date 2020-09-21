module ApplicationHelper
	#Bootstrapのflashメッセージ機能追記
	def flash_class_for flash_type
    case flash_type
      when 'success' then 'alert-success'
      when 'danger' then 'alert-danger'
      when 'info' then 'alert-info'
    end
  end

  # 小数点切り捨てはfloor,３桁区切りはto_s(:delimited)
  # 税込の計算
  def tax_price(price)
    (price * 1.1).floor
  end

end
