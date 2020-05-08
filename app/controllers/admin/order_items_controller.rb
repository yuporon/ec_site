class Admin::OrderItemsController < ApplicationController

    def update
        order_item = OrderItem.find(params[:id])
        order_item.update(order_item_params)
        if order_item.is_production == 'production'
            order_item.order.status = 2
            order_item.order.save
        end
        order_items = order_item.order.order_items
        check = 0
        order_items.each do |f|
            if f.is_production == 'production_comp'
              check += 1
            end
        end
        if order_items.length == check
            order_item.order.status = 3
            order_item.order.save
          end
        redirect_to admin_order_path(order_item.order_id)
    end
  
    private
        def order_item_params
          params.require(:order_item).permit(:is_production)
      end
end
