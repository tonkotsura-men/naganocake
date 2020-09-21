class Publics::HomesController < ApplicationController
  def about
  end

  def top
  	@items = Item.all.sample(4)
  end
end
