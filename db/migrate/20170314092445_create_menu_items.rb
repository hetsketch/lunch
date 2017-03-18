class CreateMenuItems < ActiveRecord::Migration[5.0]
  def change
    #don't modify this AFTER migration
    #create new
    create_table :menu_items do |t|
      #type :name
      t.string :name
      t.float  :price
      t.float  :weight

      t.timestamps
      # :created_at, :updated_at
    end
    #added indexation
    add_index :menu_items, :price
    add_index :menu_items, :name
  end
end
