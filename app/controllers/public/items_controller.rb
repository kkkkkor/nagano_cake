class Public::ItemsController < ApplicationController
  def index
    # @item = Item.find(params[:id])
    @items = Item.all
  end
  
  def new 
    
  end

  def show

  end
end
