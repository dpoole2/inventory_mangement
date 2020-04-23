class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.text :note
      t.bigint :menu_items_id
      t.bigint :order_id
      t.timestamps
    end
  end
end
