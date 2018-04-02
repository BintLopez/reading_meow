require 'rails_helper'
require 'reading_requests/initiate'
require 'reading_requests/accept'
require 'reading_requests/checkout'

RSpec.describe "Reading Requests End to End Integration Test" do
	# Note -- we can use a lazy let here because we will
	# end up creating out kitty with our action on ln 28
	let(:kitty) { FactoryBot.create(:cat) }
	let(:request_data) do
		{
			genre: "romance",
			num_books: 5,
			urgency: "asap"
		}
	end

	# Use let! to define and evaluate these immediately
	# Alternatively, you could do this in a before block
	# before do
	#   wrangler_1
	#   wrangler_2
	# end
	let!(:wrangler_1) { FactoryBot.create(:cat_reading_wrangler) }
	let!(:wrangler_2) { FactoryBot.create(:cat_reading_wrangler) }

	let(:library) { FactoryBot.create(:library) }

	let(:book_1) { FactoryBot.create(:book) }
	let(:book_2) { FactoryBot.create(:book) }
	let(:book_3) { FactoryBot.create(:book) }

	let!(:books) { [book_1, book_2, book_3] }

	it "happy path" do
		# Initiating a request creates a book request for the cat
		# Sends a notification to the available cat reading wranglers
		expect{ ReadingRequests::Initiate.call(cat: kitty, request_data: request_data) }
			.to change{ kitty.book_requests.count }
			.by(1) # initiating a reading request should only create one book request for cat
			.and change{ ActionMailer::Base.deliveries.count }
			.by(2) # the number of available wranglers

		current_request = kitty.current_book_request

		# Accepting a request associates the request to the wrangler
		expect{ ReadingRequests::Accept.call(initiated_request: current_request, wrangler: wrangler_1) }
			.to change{ wrangler_1.book_requests.count }
			.by(1)

		# Checking out books for the request creates a checkout
		expect{ ReadingRequests::Checkout.call(request: current_request, books: books, library: library) }
			.to change{ current_request.checkout }
			.from(nil)
			.to an_instance_of(Checkout)

		checkout = current_request.checkout
		expect(checkout.books.count).to eq(3)
		expect(checkout.books).to match_array(books)
	end

end