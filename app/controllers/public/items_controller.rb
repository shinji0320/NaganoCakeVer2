# TODO:Kaminariを導入する
# TODO:20210122indexに引数を付けてもitems_path(引数)でindex.html.erbへ跳ぶのか質問する

class Public::ItemsController < ApplicationController

  def index
    @genres = Genre.all
    @items = Item.Where(is_sold: ture).all
  end

  # TODO:0210122indexに引数を付けず、検索条件で分離するやり方。不要なら削除
  # def index_order_by_id
  #   @items = Item.where(params:id).page(params[:page]).per(8).reverse_order
  #   @page_name = "商品"
  #   redirect_to items_path
  # end
  # def index_order_by_genre
  #   @items = Item.where(params:genre_id).page(params[:page]).per(8).reverse_order
  #   @page_name = "ジャンル"
  #   redirect_to items_path
  # end

  def show
      @item = Item.find(params[:id])
      @cart_item = Cart_item.new
  end

  def genre_name
    Genre.find(params[:genre_id]).name
  end

end
