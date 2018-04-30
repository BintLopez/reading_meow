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

  let!(:wrangler_1) { FactoryBot.create(:cat_reading_wrangler) }
  let!(:wrangler_2) { FactoryBot.create(:cat_reading_wrangler) }

  def initiate
    ReadingRequests::Initiate.call(cat: kitty, request_data: request_data)    
  end

  it "happy path" do
    # Initiating a request creates a book request for the cat
    expect{ initiate }
      .to change{ kitty.book_requests.count }
      .by(1)
      .and change{ ActionMailer::Base.deliveries.count }
      .by(2)
    # Sends a notification to the available cat reading wranglers
  end
end