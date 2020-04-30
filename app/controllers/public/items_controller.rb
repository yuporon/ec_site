class Public::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    # binding.pry
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    # @cart_item = @item.cart_item.new
  end
end
