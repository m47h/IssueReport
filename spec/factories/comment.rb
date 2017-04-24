FactoryGirl.define do
  factory :comment do
    body Faker::Lorem.paragraph(2, true, 4)
    issue_id 1
  end
end
