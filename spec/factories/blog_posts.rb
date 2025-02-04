FactoryBot.define do
  factory :blog_post do
    title { Faker::Lorem.sentence }
    body { Faker::Lorem.paragraph }
    association :user
  end
end
