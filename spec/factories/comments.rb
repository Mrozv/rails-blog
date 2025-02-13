FactoryBot.define do
  factory :comment do
    content { "MyText" }
    blog_post { nil }
    user { nil }
  end
end
