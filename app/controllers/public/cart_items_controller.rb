class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
    @cart_item = CartItem.new
    @total = 0
  end
  
  def new
    @cart_item = Cart_item.new
  end

  def update
  end

  def destroy
  end

  def all_destroy
  end

  def create
     cart_item = CartItem.new(cart_item_params)
     cart_item.customer_id = current_customer.id
     cart_item.save
     redirect_to cart_items_path
  end
  def destroy_all
  Article.destroy_all
  redirect_to cart_items_path
  end
  private
   def order_products_params
     params.require(:order_products).permit(:item_id, :order_id, :tax_included_price, :quantity, :making_status)
   end
   def cart_item_params
       params.require(:cart_item).permit(:item_id, :amount)
   end

end
