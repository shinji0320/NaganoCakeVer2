class Admin::OrderItemsController < ApplicationController
  def update
    @order = Order.find(params[:order_id])
    @order_item = @order.making_status
    @order_item.update
    redirect_to admin_order_path(@order)
  end
end
