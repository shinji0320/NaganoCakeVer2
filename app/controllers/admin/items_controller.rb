class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def index
    @items = Item.all
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to 
    else
      render :
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    if @item.update(item_params)
      flash[:success] = "商品内容をを変更しました"
      redirect_to 
    else
      render :
    end
  end
  
  private
  def item_params
    params.require(:product).permit(:name, :image, :explanation, :genre_id, :tax_out_price, :is_sale)
  end
end
