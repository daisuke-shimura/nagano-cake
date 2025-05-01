class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!

  def top
  end

  def index
    @items = @q.result(distinct: true).includes(:genre).page(params[:page]).per(10)
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
    @genres = Genre.pluck(:id, :name)
    @submit = "新規登録"
  end

  def edit
    @item = Item.find(params[:id])
    @genres = Genre.pluck(:id, :name)
    @submit = "変更を保存"
  end

  def create
    item = Item.new(item_params)
    item.save
    redirect_to admin_items_path
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
    redirect_to admin_item_path(item.id)
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to admin_items_path
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :introduction, :genre_id, :price, :is_active)
  end
end
