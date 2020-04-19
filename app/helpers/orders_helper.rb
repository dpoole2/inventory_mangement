module OrdersHelper

    def menu_items
        MenuItem.all.pluck(:name, :id)
    end
end
