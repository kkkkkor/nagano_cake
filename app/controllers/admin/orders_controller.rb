class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_products = @order.order_products
  end
  def order_params
   params.require(:order).permit(:shipping_postal_code, :shipping_address,:shipping_name, :method_of_payment, :postage, :billing_amount)
  end
  def order_product_params
    params.require(:order_product).permit(:name)
  end
end
