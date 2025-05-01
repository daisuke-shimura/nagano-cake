class ApplicationController < ActionController::Base
  before_action :set_search_variable

  def customer_is_active
    unless current_customer.is_active
      #退会したユーザ
      redirect_to destroy_customer_session_path
    end
  end

  def set_search_variable
    @q = Item.ransack(params[:q])
  end
end
