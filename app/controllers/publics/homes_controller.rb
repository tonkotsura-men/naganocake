class Publics::HomesController < ApplicationController
  def about
  end

  def top
  	@items = Item.all.sample(4)
	@genres = Genre.where(is_active: true).page(params[:page]).per(10)
  end
end
