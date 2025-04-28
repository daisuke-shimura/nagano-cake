class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  before_action :cart_item_empty, only: [:new]

  def new
    @order = Order.new
    @customer = current_customer
    @address = Address.where(customer_id: current_customer.id)
  end


  def create
    address_option = params[:order][:address_option].to_i

    if address_option == 0
      order = Order.new(order_address_params)
      order.post_number = current_customer.post_number
      order.address = current_customer.address
      order.name = "#{current_customer.last_name} #{current_customer.first_name}"

    elsif address_option == 1
      order = Order.new(order_address_params)
      address = Address.find(params[:order][:address_id])
      order.post_number = address.post_number
      order.address = address.address
      order.name = address.name

    elsif address_option == 2
      order = Order.new(order_address_params)

    else
      #エラー
      redirect_to new_order_path(current_customer.id)
    end
    
    order.customer_id = current_customer.id
    order.delivery_fee = 800
    order.total_cost = 0

    order.save#order.idをつけるため

    CartItem.includes(:item).where(customer_id: current_customer.id).each do |cart|
      order.total_cost += (cart.item.price)*(cart.amount)
      detail = OrderDetail.new
      detail.order_id = order.id
      detail.item_id = cart.item.id
      detail.price = cart.item.price
      detail.amount = cart.amount
      detail.save
    end

    order.save
    redirect_to order_confirm_path(order.id)
  end


  def destroy
    order = Order.find(params[:id])
    order.destroy
    redirect_to new_order_path(current_customer.id)
  end


  def confirm
    @order = Order.find(params[:id])
    @cart = CartItem.includes(:item).where(customer_id: current_customer.id)
  end


  def decision

  end


  def index
    @orders = Order.includes(order_details: :item).where(customer_id: current_customer.id)
  end


  def show
    @order = Order.includes(order_details: :item).find(params[:id])
  end


  private

  def order_params
    params.require(:order).permit(:payment_method)
  end


  def order_address_params
    params.require(:order).permit(:payment_method, :address, :post_number, :name)
  end


  def order_detail_params
    params.require(:order_detail).permit()
  end


  def cart_item_empty
    if CartItem.where(customer_id: current_customer.id).empty?
      #空です
      redirect_to cart_items_path
    end
  end
end
