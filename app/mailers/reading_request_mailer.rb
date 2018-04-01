class ReadingRequestMailer < ApplicationMailer
	default from: 'notifications@readingmeow.com'

	def new_request(user)
		mail(to: user.email, subject: 'New Book Request')
	end
end