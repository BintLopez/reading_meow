require 'verbalize'

module ReadingRequests
	class Checkout
		include Verbalize::Action

		input :books, :request, :library
		
		def call
			checkout = ::Checkout.create(
				library: library,
				book_request: request,
				return_due_date: Date.current + library.return_window_days,
			)

			books.each do |book|
				::BookCheckout.create(
					book: book,
					checkout: checkout,
					checked_out_date: Date.current
				)
			end
		end
	end
end