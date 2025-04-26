class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    customer = Customer.find(params[:id])
    customer.update(admin_customer_params)
    redirect_to admin_customer_path(customer.id)
  end


  private
  def admin_customer_params
    params.require(:customer).permit(
      :last_name, :first_name, :last_name_kana, :first_name_kana,
      :post_number, :address, :phone_number, :email, :is_active 
    )
  end
end
