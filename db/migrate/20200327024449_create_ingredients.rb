class CreateIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :ingredients do |t|
      t.bigint :menu_item_id
      t.bigint :item_id
      t.timestamps
    end
  end
end
