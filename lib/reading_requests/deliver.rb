module ReadingRequest
	class Deliver
		include Verbalize::Action

		input :request

		def call
			request.update!(
				status: 'delivered',
				delivered_at: Time.current
			)
		end
	end
end