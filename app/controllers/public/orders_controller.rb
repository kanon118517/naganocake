class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @customer = current_customer
    @order.delivery_charge = 800
  end

  def confirm
    @order = Order.new(order_params)
    @order.delivery_postal_code = current_customer.postal_code
    @order.delivery_adress = current_customer.address
    @order.delivery_name = current_customer.last_name + current_customer.first_name
    @cart_items = CartItem.all
    @total = @cart_items.inject(0) { |sum, item| sum + item.subtotal }
  end

  def complete


  end

  def create
    @order = Order.new(order_params)
    @order.save
    @cart_items = current_customer.cart_items
    @cart_items.destroy_all
    redirect_to complete_orders_path
  end

  def index
    @order = Order.all
    @cart_item = CartItem.all
  end

  def show
    @order = Order.find(params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :payment_method, :delivery_charge, :delivery_postal_code, :delivery_adress, :delivery_name, :payment)
  end

end
