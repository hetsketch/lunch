FactoryGirl.define do
  factory :category do
    name Faker::Food.unique.ingredient
  end
end