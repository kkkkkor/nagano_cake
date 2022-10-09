class Public::ItemsController < ApplicationController
  def index
    @items = Item.all
    @genres = Genre.all
  end

  def new

  end

  def show
     @item = Item.find(params[:id])
     @cart_item = CartItem.new
  end
  def item_params
   params.require(:item).permit(:name, :introduction,:genre_id, :price, :image, :is_active, :cart_item)
  end
end
