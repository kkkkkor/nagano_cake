class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirm
  end

  def thanks
  end

  def create
    cart_items = current_customer.cart_items.all
      @order = current_customer.orders.new(order_params)
    if @order.save
      cart_items.each do |cart|
      order_item = OrderItem.new
      order_item.item_id = cart.item_id
      order_item.order_id = @order.id
      order_item.order_quantity = cart.quantity
      order_item.order_price = cart.item.price
      order_item.save
    end
    redirect_to path confirm_orders_path
      cart_items.destroy_all
    else
      @order = Order.new(order_params)
    render :new
    end
  end

  def confirm
    @total = 0
    @order = Order.new(order_params)
    @order.method_of_payment = params[:order][:payment_method]
    if params[:order][:select_address] == "0"
    @order.shipping_address = current_customer.address
    @order.shipping_name = current_customer.last_name + current_customer.first_name
    @order.shipping_postal_code = current_customer.postal_code
    elsif params[:order][:select_address] == "1"
    @order.shipping_address = ShippingAddress.find(params[:order][:address_id]).address
    @order.shipping_name = ShippingAddress.find(params[:order][:address_id]).name
    @order.shipping_postal_code = ShippingAddress.find(params[:order][:address_id]).postal_code
    else
    @order.shipping_address = Order.new(order_params).shipping_address
    @order.shipping_name = Order.new(order_params).shipping_name
    @order.shipping_postal_code = Order.new(order_params).shipping_postal_code
    end
    @cart_items = current_customer.cart_items.all
    # @address = Address.find(params[:order][:address_id])
    # @order.postal_code = @address.postal_code
    # @order.address = @address.address
    # @order.name = @address.name
  end

  def index
  end

  def show
  end
  def order_params
   params.require(:order).permit(:shipping_postal_code, :shipping_address,:shipping_name, :method_of_payment, :postage, :billing_amount, :status)
  end
end
