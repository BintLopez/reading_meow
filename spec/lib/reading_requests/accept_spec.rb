require 'rails_helper'
require 'reading_requests/accept'

RSpec.describe ReadingRequests::Accept do
  let(:initiated_request) do
    instance_double(BookRequest,
      accepted_at: accepted_timestamp,
      urgency_num_days: 5
    )
  end

  let(:wrangler)   { instance_double(CatReadingWrangler) }
  let(:today)      { Date.new(2018,11,21) }
  let!(:right_now) { Time.now }

  before do
    allow(Date).to receive(:current).and_return(today)
    allow(Time).to receive(:current).and_return(right_now)
  end

  subject do
    described_class.call(
      initiated_request: initiated_request,
      wrangler: wrangler
    )
  end

  context 'When the request has already been accepted' do
    let(:accepted_timestamp) { Time.now - 300 }
  
    it 'does not accept the request' do
      expect(initiated_request).not_to receive(:update!)
      subject
    end
  end

  context 'When the request has not yet been accepted' do
    let(:accepted_timestamp) { nil }

    it 'updates the initiated request' do
      expect(initiated_request)
        .to receive(:update!)
        .with(
          cat_reading_wrangler: wrangler,
          accepted_at: right_now,
          delivery_date: today + 5
        )
      subject
    end
  end

end