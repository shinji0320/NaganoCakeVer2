class Public::ItemsController < ApplicationController

  def index
    @items = Item.where(is_sold: true).page(params[:page]).per(4)
  end

  def show
    @item = Item.find(params[:id])
    #@cart_item = CartItem.new
  end

  private

  def item_params
    params.require(:item).permit(:name, :detail, :genre_id, :is_sold, :price, :image_id)
  end

end
