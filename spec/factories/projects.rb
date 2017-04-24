FactoryGirl.define do
  factory :project do
    name Faker::Name.unique.name
  end
end
