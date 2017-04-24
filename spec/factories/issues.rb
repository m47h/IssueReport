FactoryGirl.define do
  factory :issue do
    name Faker::Name.unique.name
    body Faker::Lorem.paragraph(2, true, 4)
    status Issue::STATUS.sample
    priority Issue::PRIORITY.sample
    image File.open(Rails.root.join('spec', 'support', '64x64.png'))
    project_id 1
    user_id 1
  end
end
