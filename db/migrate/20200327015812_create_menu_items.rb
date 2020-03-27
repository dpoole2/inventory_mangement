class CreateMenuItems < ActiveRecord::Migration[5.2]
  def change
    create_table :menu_items do |t|
      t.string :name
      t.integer :price
      t.bigint :order_id

      t.timestamps
    end
  end
end
