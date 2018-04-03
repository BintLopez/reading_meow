gem 'verbalize'
# Read more about the Verbalize gem here:  https://github.com/taylorzr/verbalize
# It's 

module ReadingRequests
	class Accept
		include Verbalize::Action

		input :initiated_request, :wrangler

		def call
			# can the wrangler accept this request?

			# update the delivery date -- eta
			# update the status
			# set the accepted_at timestamp
		end
	end
end