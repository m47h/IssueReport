FactoryGirl.define do
  factory :project do
    name Faker::Name.unique.name
    user_id 1
  end
end
