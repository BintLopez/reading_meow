require "factory_bot"
require "faker"

5.times do
	user = FactoryBot.build(:user)
	user.save(validate: false)
	FactoryBot.create(:cat, user: user)
	FactoryBot.create(:contact, contactable: user)
end

5.times do
	user = FactoryBot.build(:user)
	user.save(validate: false)
	FactoryBot.create(:cat_reading_wrangler, user: user)
	FactoryBot.create(:contact, contactable: user)
end

5.times do
	library = FactoryBot.create(:library)
	FactoryBot.create(:contact, contactable: library)
end
