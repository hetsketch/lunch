FactoryGirl.define do
  factory :user do
    name Faker::Name.unique.name # Returns unique name every time it's called
    email Faker::Internet.unique.email
    password 'password'
    password_confirmation 'password'
  end

  factory :admin, class: User do
    name 'admin'
    email Faker::Internet.unique.email
    password 'password'
    password_confirmation 'password'
    admin true
  end
end