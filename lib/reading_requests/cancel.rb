module ReadingRequests
	class Cancel
		include Verbalize::Action
		
		input :requestor, :request

		def call
			return unless requestor.can_cancel?
			return unless request.cancelable?

			request.update!(
				status: "canceled"
			)
		end
	end
end