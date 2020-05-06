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
      if order.status == 'confirmation_pay'
          order.order_items.each do |order_item|
              order_item.status = 1
              order_item.save
          end
      end
      redirect_to admin_order_path(order)
  end

  private
      def order_status_params
          params.require(:order).permit(:status)
      end
end
