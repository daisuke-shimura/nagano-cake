class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    customer = Customer.find(params[:id])
    if customer.update(customer_params)
      redirect_to customer_path(customer.id)
    else
      redirect_to edit_customer_path(customer.id)
    end
  end

  def confirm
    @customer = Customer.find(params[:id])
  end

  def quit
    customer = Customer.find(params[:id])
    customer.is_active = false
    customer.save
    redirect_to customer_path(current_customer.id)
  end

  private
  def customer_params
    params.require(:customer).permit(
      :last_name, :first_name, :last_name_kana, :first_name_kana,
      :post_number, :address, :phone_number, :email, :is_active 
    )
  end
end
