module ReadingRequests
	class Return
		include Verbalize::Action

		input :request, :books_condition_data
		
		def call
			update_books_conditions!

			request.checkout.book_checkouts.each do |bc|
				bc.update!(
					eff_date: Date.current,
					action: 'return',
					condition: bc.condition
				)
			end

			request.update!(
				status: "returned",
			)

			request.checkout.update!(
				returned_at: Time.current
			)
		end

		private

		def update_books_conditions!
			# implement me
		end

	end
end