FactoryBot.define do
  factory :cat_reading_wrangler do
    library_card_number { Faker::Crypto.md5 } # generates a long string
    user                { FactoryBot.create(:user) }
    library             { FactoryBot.create(:library) }
  end
end
