# Welllll....

# We were going to use this file to seed some
# helpful data into our development db, but
# I'm getting an error when trying to seed my db
# with users!

# Commented on a closed rails issue here:
# https://github.com/rails/rails/issues/18407#issuecomment-377653442

# Can you reproduce?
# comment in the following code, save, and run `rake db:seed`

# require "factory_bot"
# require "faker"

# 5.times do
# 	user = FactoryBot.create(:user)
# 	FactoryBot.create(:cat, user: user)
# 	FactoryBot.create(:contact, contactable: user)
# end

# 5.times do
# 	user = FactoryBot.create(:user)
# 	FactoryBot.create(:cat_reading_wrangler, user: user)
# 	FactoryBot.create(:contact, contactable: user)
# end

# 5.times do
# 	library = FactoryBot.create(:library)
# 	FactoryBot.create(:contact, contactable: library)
# end
