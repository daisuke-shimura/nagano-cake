class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!

  def update
    detail = OrderDetail.find(params[:id])
    detail.update(admin_order_detail_params)

    if detail.making_status == "making"
      order = Order.find(detail.order_id)
      order.update(order_status: 2)

    elsif detail.making_status == "making_complete"
      details = OrderDetail.where(order_id: detail.order_id)

      if details.all?{ |detail| detail.making_status == "making_complete" }
        order = Order.find(detail.order_id)
        order.update(order_status: 3)
      end

    end

    redirect_to request.referer
  end


  private
  def admin_order_detail_params
    params.require(:order_detail).permit(:making_status)
  end
end
