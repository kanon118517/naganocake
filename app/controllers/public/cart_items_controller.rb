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
    @cart_items = CartItem.find(params[:id])
    @cart_items.destroy
    redirect_to cart_items_path
  end

  def destroy_all
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
      cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
      cart_item.amount += params[:cart_item][:amount].to_i
      cart_item.save
      redirect_to cart_items_path
    else
    @cart_item.save
    redirect_to cart_items_path
    end
  end

   private

  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
  end



end
