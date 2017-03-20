class MenuItem < ApplicationRecord
  validates :name, :price, :category_id, presence: true
  validates :price, numericality: {greater_than: 0}
  # mount_uploader :photo, ItemPhotoUploader

  has_and_belongs_to_many :orders
  has_and_belongs_to_many :menu
  belongs_to :category
end
