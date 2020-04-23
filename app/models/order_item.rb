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

end
