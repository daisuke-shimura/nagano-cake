class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  def show
    @order = Order.includes(:customer, :order_details, order_details: :item).find(params[:id])
  end

  def update
  end

  def make
    
  end
end
