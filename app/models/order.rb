class Order < ApplicationRecord
    has_many :menu_items
    accepts_nested_attributes_for :menu_items, allow_destroy: true
end
