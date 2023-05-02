class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
    @total = @cart_items.inject(0) { |sum, item| sum + item.subtotal }
    #@item = Item.find(params[:id])
  end

  def update
    @cart_items = CartItem.all
    @cart_items.update(cart_item_params)
  end

  def destroy
  end

  def destroy_all
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @cart_item.save
    redirect_to cart_items_path
    #@item = Item.find(cart_item_params[:item_id])

  end

   private

  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
  end



end
