module HomesHelper

    def recent_orders
        Order.all.order("created_at desc").limit(5)
    end
end
