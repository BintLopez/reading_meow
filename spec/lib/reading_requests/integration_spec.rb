require 'rails_helper'
require 'reading_requests/initiate'

RSpec.describe "Reading Requests End to End Integration Test" do
	let(:kitty) { FactoryBot.create(:cat) }
	let(:request_data) do
		{
			genre: "romance",
			num_books: 5,
			urgency: "asap"
		}
	end

	let(:wrangler_1) { FactoryBot.create(:cat_reading_wrangler) }
	let(:wrangler_2) { FactoryBot.create(:cat_reading_wrangler) }

	it "happy path" do
		# Initiating a request creates a book request for the cat
		# Sends a notification to the available cat reading wranglers
		binding.pry

		expect(kitty.book_requests.count).to eq(0)
		ReadingRequests::Initiate.call(cat: kitty, request_data: request_data)
		expect(kitty.book_requests.count).to eq(1)

		binding.pry

		expect{ ReadingRequests::Initiate.call(cat: kitty, request_data: request_data) }
			.to change{ kitty.book_requests.count }
			.by(1) # initiating a reading request should only create one book request for cat
			.and change{ ActionMailer::Base.deliveries.count }
			.by(2) # the number of available wranglers
	end

end