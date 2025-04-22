class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    customer = current_customer
    if customer.update(customer_params)
      redirect_to customers_my_page_path
    else
      redirect_to customers_information_edit_path
    end
  end

  def confirm
    @customer = current_customer
  end

  def quit
    customer = current_customer
    customer.is_active = false
    customer.save
    redirect_to customers_my_page_path
  end

  private
  def customer_params
    params.require(:customer).permit(
      :last_name, :first_name, :last_name_kana, :first_name_kana,
      :post_number, :address, :phone_number, :email, :is_active 
    )
  end
end
