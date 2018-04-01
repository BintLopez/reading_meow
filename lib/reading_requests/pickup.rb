require 'verbalize'

module ReadingRequests
	class PickUp
		include Verbalize::Action
		
		input :live_request

		def call
			live_request.update!(
				status: 'picked_up',
				picked_up_at: Time.current
			)
		end
	end
end