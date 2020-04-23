module OrdersHelper

    def menu_items
        MenuItem.all.pluck(:name, :id)
    end

    def order_items(order_id)
        OrderItem.where(order_id: order_id)
    end
end
