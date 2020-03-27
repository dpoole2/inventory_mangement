json.extract! item, :id, :name, :amount, :food, :cost_per_unit, :created_at, :updated_at
json.url item_url(item, format: :json)
