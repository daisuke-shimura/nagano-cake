class Public::ItemsController < ApplicationController
  #before_action :authenticate_customer!
  def index
    @items = @q.result(distinct: true).where(is_active: true).page(params[:page]).per(8)
    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @genres = Genre.all
    @cart = CartItem.new
  end
end
