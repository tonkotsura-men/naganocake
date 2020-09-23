class Admins::HomesController < ApplicationController
  def top
  	today = Date.today
  	@orders = Order.where("created_at > #{today}")
  end
end
