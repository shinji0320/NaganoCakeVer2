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

  def empty_cart
    @cart_items = Cart_items.current_customer.id
  end

end
