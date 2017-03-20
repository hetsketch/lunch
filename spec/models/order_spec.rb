require 'spec_helper'

describe Order do
  
  it 'should be calculate the total price of the order' do
    order = FactoryGirl.create :order
    # Order already has one menu_item with price 200
    # Add one more
    order.menu_items << FactoryGirl.create(:menu_item)
    order.menu_items << FactoryGirl.create(:menu_item)
    
    order.calculate_total
    order.total.should == 600
  end
  
  it 'should not contain more than 3 items' do
    order = FactoryGirl.create :order
    order.menu_items << FactoryGirl.create(:menu_item)
    order.menu_items << FactoryGirl.create(:menu_item)
    order.menu_items << FactoryGirl.create(:menu_item)
    # It is 4 items now
    order.should have(1).error_on(:menu_items)
  end
  
  it 'should not contain less than 1 items' do
    order = FactoryGirl.create :order
    order.menu_items.clear
    # It is 0 items now
    order.should have(1).error_on(:menu_items)
  end


end