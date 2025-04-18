class Public::ItemsController < ApplicationController
  #before_action :authenticate_customer!
  def index
    @items = Item.all
    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @genres = Genre.all
    @cart = CartItem.new
  end
end
