class Public::CartItemsController < ApplicationController
  def index
    
  end

  def create
    cart = CartItem.new
    item = Item.find(params[:item_id])
    cart.customer_id = current_customer.id
    cart.item_id = item.id
    cart.amount = 1
    if cart.save
    else
      cart = CartItem.find_by(item_id: item.id)
      cart.amount += 1
    end
    redirect_to request.referer
  end

  def update
    cart = CartItem.find(params[:id])
  end

  def destroy
    cart = CartItem.find(params[:id])
    cart.destroy
    redirect_to request.referer
  end
end
