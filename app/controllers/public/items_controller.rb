class Public::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(param[:id])
    @item_new = Item.new
  end
end
