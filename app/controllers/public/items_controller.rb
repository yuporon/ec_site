class Public::ItemsController < ApplicationController
  def top
  end

  def index
    @items = Item.where(sale_status: 1)
  end

  def show
    # binding.pry
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    # @cart_item = @item.cart_item.new
  end
end
