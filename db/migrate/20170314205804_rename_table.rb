class RenameTable < ActiveRecord::Migration[5.0]
  def change
    rename_table :menus_menu_items, :menu_items_menus
  end
end
