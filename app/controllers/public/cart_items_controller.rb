class Public::CartItemsController < ApplicationController

  def index
  end

  def create
  end

  def update
  end

  def destroy
  end

  def empty_cart
    @cart_items = Cart_items.current_customer.id
  end

end
