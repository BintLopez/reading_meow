module ReadingRequests
	class Return
		include Verbalize::Action

		input :request, :books_condition_data
		
		def call
			update_books_conditions!

			checkout.book_checkouts.each do |bc|
				bc.update!(
					eff_date: Date.current,
					action: 'return',
					condition: bc.book.condition
				)
			end

			request.update!(
				status: "returned",
			)

			checkout.update!(
				returned_at: Time.current
			)
		end

		private

		def update_books_conditions!
			checkout.books.each do |book|
				new_condition = books_condition_data[book.id]
				next unless new_condition
				book.update!(condition: new_condition)
			end
		end

		def checkout
      @checkout ||= request.checkout
    end

	end
end