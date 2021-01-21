class Admin::OrderItemsController < ApplicationController
  def update
    order = Order.find(params[:order_id])
    order_item = order.making_status
    order_item.update
    redirect_to request.referer
  end
end
