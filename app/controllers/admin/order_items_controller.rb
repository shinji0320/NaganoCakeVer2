class Admin::OrderItemsController < ApplicationController
  def update
    # order = Order.find(params[:order_id])
    # order_item = order_id.OrderItem.find(params[:id])
    order_item = OrderItem.find(params[:id])
    order_item.update(making_status_params)
    flash[:success] = "製作ステータスを変更しました"
    redirect_to admin_order_path(order_item.order)
  end

  private
  def making_status_params
    params.require(:order_item).permit(:making_status)
  end
end

# .merge(order_id: order.id)