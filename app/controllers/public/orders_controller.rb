class Public::OrdersController < ApplicationController
    before_action :authenticate_end_user!
    before_action :cart_item_check, only: [:new, :verification, :create]

    def new
        @order = Order.new
        @addresses = Address.where(end_user_id: current_end_user.id)
    end
    def verification
        @cart_items = current_end_user.cart_items
        @order = Order.new(order_params)
        @order.total_payment = 0
        @order.postage = 800
        @order.payment_method = params[:order][:payment_method]
        @order.status = 0
        if  params[:order][:address_option] == "0"
            @order.address = current_end_user.address
            @order.postal_code = current_end_user.postal_code
            @order.address_name = "#{current_end_user.last_name}#{current_end_user.first_name}"
        elsif params[:order][:address_option] == "1"
            address_collection = params[:order][:address_collection]
            address = Address.find(address_collection)
            @order.address = address.address
            @order.postal_code = address.postal_code
            @order.address_name = address.address_name
        elsif params[:order][:address_option] == "2"
            postal_code = params[:order][:postal_code]
            address = params[:order][:address]
            address_name = params[:order][:address_name]
            @order.postal_code = postal_code
            @order.address = address
            @order.address_name = address_name
        end
    end
    def completed
    end

    def create
        @order = Order.new(order_params)
        @order.end_user_id = current_end_user.id
        @order.save
        current_end_user.cart_items.each do |cart_item|
            @order_item = OrderItem.new
            @order_item.order_id = @order.id
            @order_item.item_id = cart_item.item_id
            @order_item.order_quanitity = cart_item.amount
            @order_item.current_value =  cart_item.item.price_nontax.to_i
            @order_item.save
        end
        current_end_user.cart_items.destroy_all
        redirect_to completed_public_orders_path
    end

    def index
        @orders = current_end_user.orders
    end

    def show
        @order = Order.find(params[:id])
    end
    
    private
    def order_params
      params.require(:order).permit(:end_user_id,:total_payment,:postage,:status,:payment_method,:address_name,:postal_code,:address)
    end

    def cart_item_check
        cart_item = current_end_user.cart_items
        unless cart_item.exists?
            redirect_to public_items_path
        end
    end
end