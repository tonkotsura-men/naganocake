class Publics::HomesController < ApplicationController
	include ApplicationHelper
  def about
  end

  def top
  	@items = Item.all.sample(4)
	@genres = Genre.where(is_active: true).page(params[:page]).per(10)
  end
end
