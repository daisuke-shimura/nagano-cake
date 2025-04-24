class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  def top
    @orders = Order.includes(:customer).all
  end
end
