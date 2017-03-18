class CreateMenus < ActiveRecord::Migration[5.0]
  def change
    create_table :menus do |t|
      t.datetime :publish_date
      t.timestamps
    end
  end
end
