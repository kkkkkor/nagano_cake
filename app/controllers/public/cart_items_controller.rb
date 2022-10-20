class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items
    @cart_item = CartItem.new
    @total = 0
  end

  def new
    @cart_item = Cart_item.new
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
     cart_item = CartItem.find(params[:id])  # データ（レコード）を1件取得
     cart_item.destroy  # データ（レコード）を削除
    redirect_to '/cart_items'
  end

  def create
    @cart_item = current_customer.cart_items.new(cart_item_params)
    # お客が新しく入れたい商品を@cart_itemにいれる
    @update_cart_item = current_customer.cart_items.find_by(item_id: @cart_item.item_id)
    # お客が新しく入れたい商品の中に同じ商品がないか探して持ってきてfind_by）@update_cart_itemにいれる
    if @update_cart_item.present?
      # もし同じ商品が存在していたら？
     @cart_item.amount = @cart_item.amount + @update_cart_item.amount
    # 新しく入れたい商品に新しく入れる商品　たす　同じ商品　を再代入（おきかえる）
      @update_cart_item.delete
      # 同じ商品はけす
    end

    if @cart_item.save
      # 商品を保存
    redirect_to cart_items_path
    # 保存したら飛ぶ
    else
      # できなかったら（こんかいはできるけど）
     @item = Item.find(params[:cart_item][:item_id])
     　　　　　　　　　# cartitemのなかのitem_idをよびだしてる！
     @cart_item = CartItem.new
    #　renderの時はcreateアクションの中でしか動かないからitemコントローラを動かすにのに必要な記述を持ってきた
    render ("public/items/show")
    end
  end

  def destroy_all
    CartItem.destroy_all
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
