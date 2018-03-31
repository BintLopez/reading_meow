FactoryBot.define do
  factory :library do
    name Faker::LordOfTheRings.location
    website_url Faker::Internet.url
  end
end
