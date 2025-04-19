class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @cart = CartItem.includes(:item).where(customer_id: current_customer.id)
    @total = 0
    @cart.each do |cart|
      @total += (cart.item.price)*(cart.amount)
    end

  end


  def create
    new_cart = CartItem.new(cart_items_params)

    if CartItem.exists?(item_id: new_cart.item_id, customer_id: current_customer.id)
      existing_cart = CartItem.find_by(item_id: new_cart.item_id, customer_id: current_customer.id)
      existing_cart.amount += new_cart.amount
      existing_cart.save
    else
      new_cart.customer_id = current_customer.id
      new_cart.save
    end

    redirect_to cart_items_path
  end


  def update
    cart = CartItem.find(params[:id])
    if params[:sign].to_i == 1
      cart.amount += 1
    else
      cart.amount -= 1
    end
    
    if cart.amount == 0
      cart.destroy
    else
      cart.save
    end
    redirect_to request.referer
  end


  def destroy
    cart = CartItem.find(params[:id])
    cart.destroy
    redirect_to request.referer
  end

  
  def all_destroy
    current_customer.cart_items.destroy_all
    redirect_to request.referer
  end

  private
  def cart_items_params
    params.require(:cart_item).permit(:amount, :item_id)
  end
end
