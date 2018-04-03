require 'rails_helper'
require 'reading_requests/initiate'

RSpec.describe ReadingRequests::Initiate do
  # Accepting a request
  #   * a wrangler can accept an initiated request
  #   * accepting a request logs the accepted_at date
  #   * and upates the status to accepted
  #   * updates the book request delivery date
  #   * notifies the cat of the delivery date

  let(:cat) do
    instance_double(Cat,
      book_requests: double(create!: true)
    )
  end

  let(:request_data) { { some: 'data' } }

  let(:wrangler) do
    instance_double(CatReadingWrangler,
      user: instance_double(User)
    )
  end

  before do
    allow(ReadingRequests::Eligibility)
      .to receive(:call)
      .with(cat: cat)
      .and_return(eligiboolean)
    allow(CatReadingWrangler)
      .to receive(:where)
      .with(available: true)
      .and_return([wrangler])
  end

  subject do
    described_class.call(cat: cat, request_data: request_data)
  end

  context 'When the cat is eligible' do
    let(:eligiboolean) { true }

    it "creates a book request and alerts the wranglers" do
      expect(cat.book_requests)
        .to receive(:create!)
        .with(
          status: BookRequest::STATUSES[:initiated],
          request_data: request_data
        )

      expect(ReadingRequestMailer)
        .to receive(:new_request)
        .with(wrangler.user)
        .and_return(double(deliver_now: nil))

      subject
    end
  end

  context 'When the cat is NOT eligible' do
    let(:eligiboolean) { false }

    it "does NOT create a book request; notifies NOBODY" do
      expect(cat.book_requests).not_to receive(:create!)
      expect(ReadingRequestMailer).not_to receive(:new_request)

      subject
    end
  end
end