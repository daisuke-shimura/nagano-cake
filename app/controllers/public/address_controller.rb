class Public::AddressController < ApplicationController
  def index
    @addresses = Address.all
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
    
  end

  private
  def address_params
    params.require(:address).permit(:name, :number, :place)
  end
end
