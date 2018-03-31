FactoryBot.define do
  factory :user do
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
    password (pword = Faker::Internet.password)
    password_confirmation pword
    email Faker::Internet.email
  end
end
