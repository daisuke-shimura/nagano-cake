class Admin::OrderDetailsController < ApplicationController
  def update
    detail = OrderDetail.find(params[:id])
    detail.update(admin_order_detail_params)
    redirect_to request.referer
  end


  private
  def admin_order_detail_params
    params.require(:order_detail).permit(:making_status)
  end
end
