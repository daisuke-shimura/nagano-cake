class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  before_action :customer_is_active
  before_action :cart_item_empty, only: [:new]

  def new
    @order = Order.new
    @customer = current_customer
    @address = Address.where(customer_id: current_customer.id)
  end

  def confirm
    @cart = CartItem.includes(:item).where(customer_id: current_customer.id)
    address_option = params[:order][:address_option].to_i
    @order = Order.new(order_params)

    if address_option == 0
      @order.post_number = current_customer.post_number
      @order.address = current_customer.address
      @order.name = "#{current_customer.last_name} #{current_customer.first_name}"

    elsif address_option == 1
      address = Address.find(params[:order][:address_id])
      @order.post_number = address.post_number
      @order.address = address.address
      @order.name = address.name

    elsif address_option == 2

    else
      #エラー
      redirect_to new_order_path
    end

    @order.customer_id = current_customer.id
    @order.delivery_fee = 800
    @order.total_cost = 0

    @cart.each do |cart|
      @order.total_cost += (cart.item.price)*(cart.amount)
    end

    if @order.valid?
      render :confirm
    else
      render :new
    end
  end

  #確定処理
  def create
    order = Order.new(order_params)

    if order.save
      CartItem.includes(:item).where(customer_id: current_customer.id).each do |cart|
        detail = OrderDetail.new
        detail.order_id = order.id
        detail.item_id = cart.item.id
        detail.price = cart.item.price
        detail.amount = cart.amount
        detail.save
      end
      redirect_to order_decision_path
    else
      Rails.logger.debug order.errors.full_messages
      render :confirm
    end
  end

=begin
  def destroy
    order = Order.find(params[:id])
    order.destroy
    redirect_to new_order_path(current_customer.id)
  end
=end

  def decision
    current_customer.cart_items.destroy_all
  end


  def index
    @orders = Order.includes(order_details: :item).where(customer_id: current_customer.id)
  end


  def show
    @order = Order.includes(order_details: :item).find(params[:id])
  end


  private
  def order_params
    params.require(:order).permit(:payment_method, :address, :post_number, :name, :customer_id, :delivery_fee, :total_cost)
  end


  def cart_item_empty
    if CartItem.where(customer_id: current_customer.id).empty?
      #空
      redirect_to cart_items_path
    end
  end
  
end
