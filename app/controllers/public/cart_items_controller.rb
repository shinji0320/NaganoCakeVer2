class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @tax = 1.1
    @cart_items = current_customer.cart_items
    @item_total = 0
    @cart_items.each do |cart_item|
      @item_total += cart_item.item.price * cart_item.count
    end
  end

  def create # カートに入れるアクション
    @item = Item.find(params[:item_id])
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @cart_item.item_id = @item.id
    @cart_items = current_customer.cart_items.all
    @cart_items.each do |cart_item|
    if cart_item.item_id == @cart_item.item_id
      new_quantity = cart_item.count + @cart_item.count
      cart_item.update_attribute(:count, new_quantity)
      @cart_item.delete
    end
  end
    @cart_item.save
    redirect_to public_cart_items_path
  end

  def update # カート内個数の変更
    cart_item = CartItem.find(params[:id])
    cart_item.update(count: params[:cart_item][:count].to_i)
    redirect_to public_cart_items_path
  end

  def empty #カートを空にする
    @cart_items = CartItem.where(customer_id: current_customer)
    @cart_items.destroy_all
    redirect_to public_cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to public_cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :count, :customer_id)
  end

end