class Public::AddressController < ApplicationController
  before_action :authenticate_customer!
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
    redirect_to address_index_path
  end

  def destroy
    address = Address.find(params[:id])
    address.destroy
    redirect_to request.referer
  end

  private
  def address_params
    params.require(:address).permit(:name, :number, :place)
  end
end
