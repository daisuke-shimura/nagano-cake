class Public::AddressesController < ApplicationController
  before_action :authenticate_customer!
  before_action :customer_is_active
  def index
    @addresses = Address.where(customer_id: current_customer.id)
    @address = Address.new
  end

  def edit
    @address = Address.find(params[:id])
  end

  def create
    address = Address.new(address_params)
    address.customer_id = current_customer.id
    address.save
    redirect_to request.referer
  end

  def update
    address = Address.find(params[:id])
    address.update(address_params)
    redirect_to addresses_path
  end

  def destroy
    address = Address.find(params[:id])
    address.destroy
    redirect_to request.referer
  end

  private
  def address_params
    params.require(:address).permit(:name, :post_number, :address)
  end
end
