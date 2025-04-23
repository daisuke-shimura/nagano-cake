class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  before_action :cart_item_empty, only: [:new]

  def new
    @order = Order.new
    @address = Address.where(customer_id: current_customer.id)
  end


  def create
    order = Order.new(order_params)
    order.customer_id = current_customer.id
    order.delivery_fee = 800
    order.total_cost = 0
    CartItem.includes(:item).where(customer_id: current_customer.id).each do |cart|
      order.total_cost += (cart.item.price)*(cart.amount)
    end
    order.save
    redirect_to order_confirm_path(order.id)
  end


  def destroy
    order = Order.find(params[:id])
    order.destroy
    redirect_to customer_path(current_customer.id)
  end


  def confirm
    @order = Order.find(params[:id])
    @cart = CartItem.includes(:item).where(customer_id: current_customer.id)
  end


  def decision

  end


  def index
    @orders = Order.where(customer_id: current_customer.id)
  end


  def show
    
  end


  private

  def order_params
    params.require(:order).permit(:payment_method, :address, :post_number, :name)
  end


  def cart_item_empty
    if CartItem.where(customer_id: current_customer.id).empty?
      #空です
      redirect_to cart_items_path
    end
  end
end
