class Public::ItemsController < ApplicationController

  def index
    @items = Item.where(is_sold: true).order("id desc")
    # @items = Item.Where(is_sold: true).order("id desc").page(params[:page]).per(8)
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = Cart_item.new
  end

end