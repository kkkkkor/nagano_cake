class Admin::ItemsController < ApplicationController
  def index
    # @item = Item.find(params[:id])
    @items = Item.page(params[:page]).per(3)
    @item = Item.all
    @genres = Genre.all

  end

  def new
    @item = Item.new
    @genres = Genre.all

  end

  def create
    item = Item.new(item_params)
    item.save
    redirect_to admin_item_path(item.id)
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    @genres = Genre.all
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
    redirect_to admin_items_path
  end

  private

  def item_params
   params.require(:item).permit(:name, :introduction,:genre_id, :price, :image, :is_active)
  end
  def genre_params
    params.require(:genre).permit(:name)
  end
end
