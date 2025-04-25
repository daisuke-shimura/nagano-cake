class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  def show
    @order = Order.includes(:customer, :order_details, order_details: :item).find(params[:id])

  end

  def update
    order = Order.find(params[:id])
    order.update(admin_order_params)
    redirect_to admin_order_path(order.id)
  end

  def make
    
  end

  private
  def admin_order_params
    params.require(:order).permit(:order_status)
  end
end
