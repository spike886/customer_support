FactoryGirl.define do
  factory :request do
    title Faker::Lorem.sentence
    description Faker::Lorem.paragraph
    status 'new'
    customer
    agent nil
  end
end
