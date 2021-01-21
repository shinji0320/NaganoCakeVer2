class Public::OrdersController < ApplicationController
 before_action :authenticate_user!
 
  def new
     @orders = Order.all
     @customer = Customer.find(params[:id])
  end

  def confirm
    @orders = Order.all
  end

  def create
    @order = Order.new(order_params)
    # @order.user_id = current_user.id
    # if @book.save
    #   redirect_to orders_path(@order)
  end

  def complete
  end

  def index
    @orders = Order.all
    @order = Order.new
  end
  
  
  def update
    @order = Order.find(params[:id])
    # if @order.update(order_params)
    #   redirect_to order_path(@order)
  end
  
  
  def show
    @orders = Order.all
    # @小計 = purchased_price*count
    # @商品の合計 = @小計 + 他の商品の小計
  end

  # def order_params
  #     params.require(:order).permit(:status)
  # end
end
