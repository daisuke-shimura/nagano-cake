class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @genre = Genre.new
    @genres = Genre.all
    @submit = "新規登録"
  end

  def create
    genre = Genre.new(genre_params)
    genre.save
    redirect_to request.referer
  end

  def edit
    @genre = Genre.find(params[:id])
    @submit = "変更を保存"
  end

  def update
    genre = Genre.find(params[:id])
    genre.update(genre_params)
    redirect_to admin_genres_path
  end


  private
  def genre_params
    params.require(:genre).permit(:name)
  end
end
