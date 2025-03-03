class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @address = Address.where(customer_id: current_customer.id)
  end

  def create
    order = Order.new(order_params)
    order.customer_id = current_customer.id
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
  end

  def decision

  end

  def index
    
  end

  def show
    
  end

  private
  def order_params
    params.require(:order).permit(:pay_method, :goal)
  end
end
