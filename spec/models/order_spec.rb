require 'spec_helper'

describe Order do

  it 'should be calculate the total price of the order' do
    order = FactoryGirl.create :order
    # Order already has one menu_item with price 200
    # Add one more
    order.menu_items << FactoryGirl.create(:menu_item)
    order.menu_items << FactoryGirl.create(:menu_item)
    order.menu_items << FactoryGirl.create(:menu_item)

    order.calculate_total
    order.total.should == 800
  end
end