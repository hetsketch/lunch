class Order < ApplicationRecord
  validates :date, :user_id, presence: true
  validates :menu_items, length: {minimum: 1, maximum: 3}
  before_save :calculate_total

  belongs_to :user
  has_and_belongs_to_many :menu_items

  # Total cost for order
  def calculate_total
    self.total = menu_items.map(&:price).inject(:+)
  end

  # Total cost for today orders
  def self.calculate_total_lunch_cost
    total_lunch_cost = 0
    orders = Order.where("date >= ?", Time.zone.now.beginning_of_day)
    orders.each do |order|
      total_lunch_cost += order.total
    end
    return total_lunch_cost
  end

end
