FactoryBot.define do
  factory :user do
    first_name            { Faker::Name.first_name }
    last_name             { Faker::Name.last_name }
    password              { Faker::Internet.password }
    password_confirmation { password }
    email                 { Faker::Internet.email }
  end
end
