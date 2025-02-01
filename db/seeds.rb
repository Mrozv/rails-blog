require "faker"

100.times do
  time = Faker::Time.between(from: DateTime.now - 30, to: DateTime.now)
  random_chars = rand(20..30)
  random_pgh = rand(2..10)

  user = User.create!(
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 8),
    created_at: time,
    updated_at: time,
    name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
  )

  BlogPost.create!(
    title: Faker::Lorem.paragraph_by_chars(number: random_chars, supplemental: false),
    body: Faker::Lorem.paragraphs(number: random_pgh, supplemental: false).join("\n\n"),
    created_at: time,
    updated_at: time,
    user_id: user.id
  )
end