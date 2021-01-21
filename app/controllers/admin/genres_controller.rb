class Admin::GenresController < ApplicationController
  def index
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to
    else
      render :
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      flash[:success] = "ジャンルを変更しました"
      redirect_to 
    else
      render :
    end
  end

  private

  def genre_params
    params.require(:genre).permit(:name, :is_valid)
  end
end