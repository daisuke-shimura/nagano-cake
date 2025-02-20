class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    
  end

  def index
    
  end

  def show
    
  end

  private
  def order_params
    params.require(:order).permit(:pay_method)
  end
end
