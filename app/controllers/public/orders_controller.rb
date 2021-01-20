class Public::OrdersController < ApplicationController

  def new
     @orders = Order.all
     @customer = Customer.find(params[:id])
  end

  def confirm
  end

  def create
  end

  def complete
  end

  def index
    @orders = Order.all
    @order = Order.new
  end

  def show
    @orders = Order.all
  end

end
