class CreateMenusMenuItems < ActiveRecord::Migration[5.0]
  def change
    create_table :menus_menu_items, id: false do |t|
      t.integer :menu_id
      t.integer :menu_item_id
    end
  end
end
