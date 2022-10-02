class Public::HomesController < ApplicationController


  def top
    @items = Item.page(params[:page]).per(4)
  end

  def about
  end

  def create
  end

  def new
  end

  def index
    @items = Item.all
    @item = Item.field(params[:id])
  end
  def item_params
   params.require(:item).permit(:name, :introduction,:genre_id, :price, :image, :is_active)
  end
end
