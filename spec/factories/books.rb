FactoryBot.define do
  factory :book do
    author    { Faker::Book.author }
    title     { Faker::Book.author }
    library   { Library.new }
    status    "checked_out"
    condition "new"
  end
end
