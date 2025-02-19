class Public::CartItemsController < ApplicationController
  def index
    @cart = CartItem.includes(:item).where(customer_id: current_customer.id)
  end

  def create
    cart = CartItem.new
    item = Item.find(params[:item_id])
    cart.customer_id = current_customer.id
    cart.item_id = item.id
    cart.amount = 1
    if CartItem.exists?(item_id: item.id, customer_id: current_customer.id)
      cart = CartItem.find_by(item_id: item.id, customer_id: current_customer.id)
      cart.amount += 1
      cart.save
    elsif cart.save
    else
    end
    redirect_to request.referer
  end

  def update
    cart = CartItem.find(params[:id])
    if params[:sign].to_i == 1
      cart.amount += 1
    else
      cart.amount -= 1
    end
    cart.save
    redirect_to request.referer
  end

  def destroy
    cart = CartItem.find(params[:id])
    cart.destroy
    redirect_to request.referer
  end
end
