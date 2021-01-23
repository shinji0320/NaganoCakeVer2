# 20210122なぜ警告マークが表示されるのかわからない
class Public::CartItemsController < ApplicationController

  def index

    @cart_items = Cart_item.where(params[:customer_id])

  end

  def create
      cart_item = Cart_item.new(cart_item_params)
      if cart_item.save
        redirect_to cart_items_path(cart_item)
      else
        render "index"
      end
  end

  def update
      cart_item = Cart_item.find(params[:id])
      if cart_item.update(cart_item_params)
        redirect_to cart_items_path(cart_item.customer_id)
      else
        @cart_items =Cart_item.where(params[:customer_id])
        flash[:danger] = "Invalid errors."
        render "index"
      end
  end

  def destroy
      cart_item = Cart_item.find(params[:id]).destroy
      redirect_back(fallback_location: root_path)
  end

  def empty_cart
    @cart_items = Cart_items.current_customer.id
  end

  private
  def cart_item_params
      params.require(:cart_item).permit(:customer_id, :item_id, :count)
  end

end
