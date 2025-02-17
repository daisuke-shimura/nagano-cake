class Public::CustomersController < ApplicationController
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
    params.require(:customer).permit(:name, :email, :is_active )
  end
end
