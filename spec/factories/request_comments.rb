FactoryGirl.define do
  factory :request_comment do
    text Faker::Lorem.paragraph
    request
    author { create :customer }
  end
end
