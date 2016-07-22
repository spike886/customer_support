FactoryGirl.define do
  factory :agent do
    email {|n| "test#{n}@agent.com"}
    name Faker::Name.name
    password Faker::Internet.password
  end
end
