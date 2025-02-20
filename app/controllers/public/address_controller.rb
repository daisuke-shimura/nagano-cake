class Public::AddressController < ApplicationController
  def index
    @addresses = Address.all
    @address = Address.new
  end

  def show
    
  end

  def create
  end

  def update
    
  end

  def destroy
    
  end

  private
  def address_params
    params.require(:address).permit(:name, :number, :place)
  end
end
