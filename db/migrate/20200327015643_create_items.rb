class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :amount
      t.boolean :food
      t.integer :cost_per_unit
      t.bigint :menu_item_id

      t.timestamps
    end
  end
end
