class Public::CartItemsController < ApplicationController
  before_action :authenticate_end_user!
  def index
    @cart_items = current_end_user.cart_items
  end

  def update
    cart_item = CartItem.find(params[:id])
    if cart_item.amount.present?
      cart_item.update(cart_item_params)
      redirect_to public_cart_items_path
    else
      @cart_items = current_end_user.cart_items
      render :index
    end
  end

  def destroy_all
    cart_items = current_end_user.cart_items
    cart_items.destroy_all
    redirect_to public_cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.delete
    redirect_to public_cart_items_path
  end


  def create
    cart_item = CartItem.new(cart_item_params)
    cart_item.end_user_id = current_end_user.id
    cart_items = current_end_user.cart_items
    check = false
    cart_items.each do |f|
      if f.item_id == cart_item.item_id
        f.amount = f.amount + cart_item.amount
        f.save
        check = true
        break
      end
    end
    if check
      redirect_to public_cart_items_path
    else
      cart_item.save
      redirect_to public_cart_items_path
    end
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:amount,:item_id,:end_user_id)
  end

end