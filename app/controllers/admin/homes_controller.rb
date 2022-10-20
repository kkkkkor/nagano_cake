class Admin::HomesController < ApplicationController
  def top
    @orders = Order.all
    # @order_products = @orders.order_products
  end
  def order_params
   params.require(:order).permit(:shipping_name, :postage,:status, :created_at)
  end
  def order_product_params
    params.require(:order_product).permit(:quantity)
  end
end