module ReadingRequests
	class Return
		include Verbalize::Action

		input :request
		
		def call
			request.checkout.book_checkouts.each |bc|
				bc.update!(returned_date: Date.current)
			end

			request.update!(
				status: "returned",
			)

			request.checkout.update!(
				returned_at: Time.current
			)
		end
	end
end