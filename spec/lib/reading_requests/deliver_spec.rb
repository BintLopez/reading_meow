require 'rails_helper'
require 'reading_requests/deliver'

RSpec.describe ReadingRequests::Deliver do
  let(:request)   { instance_double(BookRequest) }
  let(:right_now) { Time.now }

  subject { described_class.call(request: request) }

  before do
    allow(Time)
      .to receive(:current)
      .and_return(right_now)
  end

  it 'sets the request status and delivered_at time' do
    expect(request)
      .to receive(:update!)
      .with(status: 'delivered', delivered_at: right_now)
    expect(subject).to be_success
  end
end