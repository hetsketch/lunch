FactoryGirl.define do
  factory :menu_item do
    name "Item N"
    price 200
    weight 50
    association :category
  end
end