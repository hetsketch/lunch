class AddPhotoToMenuItems < ActiveRecord::Migration[5.0]
  def change
    add_column :menu_items, :photo, :string
  end
end
