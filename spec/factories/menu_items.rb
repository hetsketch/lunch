FactoryGirl.define do
  factory :menu_item do
    name Faker::Food.unique.ingredient
    price 200
    weight 50
    association :category
  end
end