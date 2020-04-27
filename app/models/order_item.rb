class OrderItem < ApplicationRecord
 belongs_to :order 
 has_one :menu_item

 def total
    MenuItem.find_by(id: self.menu_items_id).price
 end

 def deplete_item#Minus one from each ingredident
    parent_item = MenuItem.find_by(id: self.menu_items_id)
    parent_item.ingredients.each do |ingredident|
        item = Item.find_by(id: ingredident.item_id)
        item.amount -= 1
        item.save(:valid =>false)
    end
 end


def self.items_map
   items = OrderItem.where("created_at > ? AND created_at < ?", Date.today.beginning_of_week + 23.hours ,Date.today.end_of_week+ 23.hours).group(:menu_items_id).count
   result = {}
   items.each do |key, value|
      result[MenuItem.find_by(id: key).name] = value
   end
   result
end


end
