class Public::CartItemsController < ApplicationController

  def index
    @cart_items = CartItem.where(customer_id: current_customer)
  end

  def create # カートに入れるアクション
    @item = Item.find(params[:item_id])
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @cart_item.item_id = @item.id
    # カートに同じ商品がある場合
    if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
      cart_item.count += params[:cart_item][:count].to_i
      cart_item.update
      flash[:notice] = "Item was successfully added to cart."
      redirect_to public_cart_items_path
    # 新しく追加する商品の場合
    elsif @cart_item.save
      flash[:notice] = "New Item was successfully added to cart."
      redirect_to public_cart_items_path
    else
      @item = Item.find(params[:item_id])
      render 'public/items/show'
    end
  end


  def update # カート内個数の変更
    @cart_item.update(count: params[:count].to_i)
    redirect_to public_cart_items_path
  end

  def empty #カートを空にする
    @cart_items = CartItem.where(customer_id: current_customer)
    @cart_items.destroy
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