module MenuItemsHelper

    def item_select
        Item.all.pluck(:name, :id)
    end
end
