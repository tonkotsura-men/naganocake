class Admins::GenresController < ApplicationController

	before_action :set_genre, only: [:edit, :update]

  def index
  	@genre = Genre.new
    @genres = Genre.all.page(params[:page]).per(10)
  end

  def edit
  end

  def create
  	@genre = Genre.new(genre_params)
    if @genre.save
       flash[:notice] = "ジャンルを追加しました"
       redirect_to admins_genres_path
    else
      @genres = Genre.all.page(params[:page]).per(10)
      render :index and return
    end
  end

  def update
  	if @genre.update(genre_params)
      flash[:success] = "ジャンルを変更しました"
      redirect_to admins_genres_path
      if @genre.is_active == false
      		@genre.items.each do |item|
          	item.is_active = false
          	item.save
      		end
    	end
    else
      render :edit and return
    end
  end

  private

  def genre_params
    params.require(:genre).permit(:name, :is_ative)
  end

  def set_genre
    @genre = Genre.find(params[:id])
  end

end
