FactoryBot.define do
  factory :contact do
  	# Note -- we're being very strict with our phone numbers
    phone_number "#{Faker::PhoneNumber.area_code}-#{Faker::PhoneNumber.exchange_code}-
#{Faker::PhoneNumber.subscriber_number}"  
    street_address_1 Faker::Address.street_address
    street_address_2 Faker::Address.secondary_address
    city Faker::Address.city
    state Faker::Address.state
    zip_code Faker::Address.zip_code
  end
end
