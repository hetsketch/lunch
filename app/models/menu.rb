class Menu < ApplicationRecord
  validates :publish_date, presence: true

  has_and_belongs_to_many :menu_items
end
