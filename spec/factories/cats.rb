FactoryBot.define do
  factory :cat do
    name Faker::Cat.name
    bio Faker::RickAndMorty.quote
    user nil
    breed Faker::Cat.breed
    profile_public false
  end
end
