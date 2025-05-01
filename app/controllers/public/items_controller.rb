class Public::ItemsController < ApplicationController
  #before_action :authenticate_customer!
  def index
    @genres = Genre.all

    if params[:genre_id].present?
      @items = @q.result(distinct: true).where(is_active: true, genre_id: params[:genre_id]).page(params[:page]).per(8)
      @index_name = Genre.find(params[:genre_id]).name
      @count = @q.result(distinct: true).where(is_active: true, genre_id: params[:genre_id]).count
    else
      @items = @q.result(distinct: true).where(is_active: true).page(params[:page]).per(8)
      @index_name = "商品"
      @count = @q.result(distinct: true).where(is_active: true).count
    end
  end

  def show
    @item = Item.find(params[:id])
    @genres = Genre.all
    @cart = CartItem.new
  end
end
