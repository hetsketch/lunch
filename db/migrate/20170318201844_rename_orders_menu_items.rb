class RenameOrdersMenuItems < ActiveRecord::Migration[5.0]
  def change
    rename_table :orders_menu_items, :menu_items_orders
  end
end
