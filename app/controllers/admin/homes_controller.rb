class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  
  def top
    if params[:customer_id].present?
      @orders = Order.includes(:customer, :order_details).where(customer_id: params[:customer_id])
    else
      @orders = Order.includes(:customer, :order_details).all
    end

  end


end
