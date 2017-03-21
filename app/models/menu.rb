class Menu < ApplicationRecord
  validates :publish_date, presence: true

  has_and_belongs_to_many :menu_items

  # Today menu
  def self.current_menu
    @current_menu = Menu.last
  end
  
  # Run always when menus#index rendering
  # Just create the same menu as yesterday(with same items)
  def self.create_today_menu
    if current_menu.publish_date < Time.zone.now.beginning_of_day
      @new_menu = current_menu.clone_with_associations
      @new_menu.publish_date = Time.zone.now
      @new_menu.save
    end
  end

  # clone menu with items & categories
  def clone_with_associations
    new_menu = self.dup
    new_menu.save
    #two-level association
    self.menu_items.each do |item|
      new_item = item.clone
      new_item.save
      new_item.category = item.category
      new_menu.menu_items << item
    end
    new_menu
  end
end
