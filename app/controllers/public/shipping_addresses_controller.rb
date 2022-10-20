class Public::ShippingAddressesController < ApplicationController

def index
@shipping_address = ShippingAddress.new
@shipping_addresses = ShippingAddress.all
end


def edit
@shipping_address = ShippingAddress.find(params[:id])
end

def create
 @shipping_addresses = ShippingAddress.all
 @shipping_address = ShippingAddress.new(shipping_address_params)
 @shipping_address.customer_id = current_customer.id
 @shipping_address.email = "1"
 if @shipping_address.save
   redirect_to shipping_addresses_path
 else
 end
end

def update
 shipping_address = ShippingAddress.find(params[:id])
 if shipping_address.update(shipping_address_params)
 redirect_to shipping_addresses_path
 end
end

private
 def shipping_address_params
     params.require(:shipping_address).permit(:customer_id, :postal_code , :address, :name)
 end


end
