FactoryGirl.define do
  factory :request_comment do
    text Faker::Lorem.paragraph
    author { create :customer }
  end
end
