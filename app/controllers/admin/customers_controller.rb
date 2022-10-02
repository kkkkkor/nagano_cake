class Admin::CustomersController < ApplicationController

  def index
    @customers = Customer.all
    @ordes = Order.all
  end
  def show
    @customer = Customer.find(params[:id])
  end


  def edit
  end

  def update
  end
  private
  def customer_params
     params.require(:customer).permit(:id, :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email, :is_deleted)
  end
end
