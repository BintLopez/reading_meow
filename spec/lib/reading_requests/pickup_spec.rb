require 'rails_helper'
require 'reading_requests/pick_up'

RSpec.describe ReadingRequests::PickUp do
  let(:request)   { instance_double(BookRequest) }
  let(:right_now) { Time.now }
  
  subject { described_class.call(live_request: request) }

  before do
    allow(Time)
      .to receive(:current)
      .and_return(right_now)
  end

  it 'updates request status to picked_up and logs the picked_up_at time' do
    expect(request)
      .to receive(:update!)
      .with(status: 'picked_up', picked_up_at: right_now)
    expect(subject).to be_success
  end
end