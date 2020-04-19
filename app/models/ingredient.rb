class Ingredient < ApplicationRecord
    #Crack I guess its the intermeideete between menu and items.
    has_many :items
    has_many :menu_items
end
