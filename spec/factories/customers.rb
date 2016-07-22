FactoryGirl.define do
  factory :customer do
    email {|n| "test#{n}@curtomer.com"}
    name Faker::Name.name
    password Faker::Internet.password
  end
end
