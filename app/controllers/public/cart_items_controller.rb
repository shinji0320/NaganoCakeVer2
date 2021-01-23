class Public::CartItemsController < ApplicationController

  def index
    @cart_items = Cart_item.where(customer_id: current_customer.id)
  end

<<<<<<< HEAD
  def create
    cart_item = Cart_item.new(cart_item_params)
    if cart_item.save
      redirect_to cart_items_path(cart_item)
    else
      render "index"
    end
  end
=======
  def create # カートに入れるアクション
    @cart_item = current_customer.cart_item.build(item_id: params[:item_id]) if @cart_item.blank
    @cart_item.count += params[:count].to_i
    if @cart_item.save
      redirect_to public_cart_items_path
    else
      redirect_to contolloer: "public::items", action: "show"
    end
  end
  
  def update # カート内個数の変更
    
>>>>>>> 3730b492e05b66977c1f5cef9fc707c040597b14

  def empty_cart
    @cart_items = Cart_item.current_customer.id
  end

  private
  
    def set_ca_item
    @line_item = current_cart.line_items.find_by(product_id: params[:product_id])
    end

    def cart_item_params
     params.require(:cart_item).permit(:customer_id, :item_id, :count)
    end

end
