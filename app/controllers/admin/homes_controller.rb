class Admin::HomesController < ApplicationController

  def top
    @order = Order.all
   # @order.each do |order|
   #
  end

end
