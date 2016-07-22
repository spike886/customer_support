FactoryGirl.define do
  factory :admin_user do
    email {|n| "test#{n}@admin.com"}
    password Faker::Internet.password
  end
end
