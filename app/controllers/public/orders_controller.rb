class Public::OrdersController < ApplicationController
 before_action :authenticate_customer!

  def new
     @orders = Order.new
     @customer = current_customer
  end

  def confirm
    @order = Order.new
    @order.payment_method = (params[:order][:payment_method]).to_i
    # @order.customer_id = current_customer.id
    @cart_items = current_customer.cart_items
    @item_total = 0
    @cart_items.each do |cart_item|
      @item_total += (cart_item.item.price * cart_item.count * 1.08).to_i
    end
    if params[:order][:address_option] == '0'
      @order.address = current_customer.address
      @order.postal_code = current_customer.postal_code
      @order.name = current_customer.first_name + current_customer.last_name
    elsif params[:order][:address_option] == '1'
      @address = Address.find(params[:order][:address_id])
      @order.address = @address.address
      @order.postal_code = @address.postal_code
      @order.name = @address.name
    elsif params[:order][:address_option] == '2'
      @order.address = params[:order][:address]
      @order.postal_code = params[:order][:postal_code]
      @order.name = params[:order][:name]
    end
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    # binding.pry
    if @order.save
      @cart_items = current_customer.cart_items
      @cart_items.each do |cart_item|
        order_item = OrderItem.new(item_id: cart_item.item.id,order_id: @order.id,count: cart_item.count,purchased_price:( cart_item.item.price * 1.08).to_i)
        order_item.save
        cart_item.destroy
      end
      redirect_to public_orders_complete_path
    end
  end

  def complete
  end

  def index
    @orders = Order.where(customer_id: current_customer)
    @order = Order.new
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      redirect_to public_orders_confirm_path
    end
  end


  def show
    @order = Order.find(params[:id])
    @orders = Order.all
    @order_item = @order.order_items

    # 商品合計の計算方法
    @item_total = 0
    @order.order_items.each do |order_item|
      @item_total += order_item.purchased_price * order_item.count
    end
  end

  private
    def order_params
        params.require(:order).permit(:name, :address, :postal_code, :payment_method, :total_price)
    end
end
