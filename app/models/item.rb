class Item < ApplicationRecord
    belongs_to :ingredients , optional: true
end
