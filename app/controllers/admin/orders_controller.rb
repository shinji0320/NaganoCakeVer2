class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(making_status_params)
      flash[:success] = "をを変更しました"
      redirect_to admin_order_path(@order)
    else
      render :show
    end
  end

  private
  def making_status_params
    params.require(:order).permit(:making_status)
  end
end
