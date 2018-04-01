require 'rails_helper'
require 'reading_requests/initiate'
require 'reading_requests/accept'

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

	it "happy path" do
		# Initiating a request creates a book request for the cat
		# Sends a notification to the available cat reading wranglers
		expect{ ReadingRequests::Initiate.call(cat: kitty, request_data: request_data) }
			.to change{ kitty.book_requests.count }
			.by(1) # initiating a reading request should only create one book request for cat
			.and change{ ActionMailer::Base.deliveries.count }
			.by(2) # the number of available wranglers

		current_request = kitty.current_book_request

		expect{ ReadingRequests::Accept.call(initiated_request: current_request, wrangler: wrangler_1) }
			.to change{ wrangler_1.reload.book_requests.count }
			.by(1)
	end

end