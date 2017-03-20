FactoryGirl.define do
  factory :order do
    date DateTime.now
    association :user
    menu_items {[FactoryGirl.create(:menu_item)]}
  end
end