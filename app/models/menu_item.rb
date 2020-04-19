class MenuItem < ApplicationRecord
    has_many :ingredients
    has_many :items, :through => :ingredients

    def create_ingredients(items)
        items.each do |item|#items should be an array of item ids
            Ingredient.create(item_id: item.to_i, menu_item_id: self.id)
        end
    end

end
