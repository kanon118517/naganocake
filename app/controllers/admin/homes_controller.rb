class Admin::HomesController < ApplicationController


  def top
    @order = Order.page(params[:page])
    @order = Order.page(params[:page]).order(created_at: :desc)
   # @order.each do |order|
   #
  end

end
