class Admin::OrdersController < ApplicationController

  def index
      @orders = Order.all
  end

  def show
      @order = Order.find(params[:id])
  end

  def update
      order = Order.find(params[:id])
      order.update(order_status_params)
      if order.status == 1
          order.order_items.each do |order_item|
              order_item.status = 1
              order_item.save
          end
      end

      order_item = OrderItem.find(params[:id])
      order_item.update(order_item_params)
      if order_item.is_production == 2
          order_item.order.status = 2
          order_item.order.save
      end
      order_items = order_item.order.order_items
      check = 0
      order_items.each do |f|
          if f.is_production == 3
            check += 1
          end
      end
      if order_items.length == check
          order_item.order.status = 3
          order_item.order.save
        end
      redirect_to admin_order_path(order)
  end

  private
      def order_status_params
          params.require(:order).permit(:status)
      end
      def order_item_params
        params.require(:order_item).permit(:is_production)
    end
end
