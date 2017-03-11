FactoryGirl.define do
  factory :user do
    email Faker::Internet.unique.email
    password Faker::Crypto.md5
  end
end
