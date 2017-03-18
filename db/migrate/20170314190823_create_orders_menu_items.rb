class CreateOrdersMenuItems < ActiveRecord::Migration[5.0]
  def change
    create_table :orders_menu_items, id: false do |t|
      t.integer :order_id
      t.integer :menu_item_id
    end
  end
end
