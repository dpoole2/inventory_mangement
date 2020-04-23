class Order < ApplicationRecord
    has_many :order_items
    accepts_nested_attributes_for :order_items, allow_destroy: true
    before_save :calulate_total
    after_save :deplete_inventory



    def calulate_total
        sum = 0
        self.order_items.each do |item|
           sum += item.total
        end
        self.total = sum
    end


    def deplete_inventory
        self.order_items.each do |item|
            item.deplete_item
        end
    end


end
