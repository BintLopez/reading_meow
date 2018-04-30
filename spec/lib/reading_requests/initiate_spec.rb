require 'rails_helper'
require 'reading_requests/initiate'

RSpec.describe ReadingRequests::Initiate do
  let(:cat) do
    instance_double(Cat,
      book_requests: double(create!: true)
    )
  end

  let(:book_request_creation) do
    double(create!: true)
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
  end

  subject do
    described_class.call(cat: cat, request_data: request_data)
  end

  context 'When cat is eligible' do
    let(:eligiboolean) { true }

    it 'creates a book request and alerts the wranglers' do
      expect(book_request_creation)
        .to receive(:create!)
        .with(status: 'initiated', request_data: request_data)
      expect(ReadingRequestMailer)
        .to receive(:new_request)
        .with(wrangler.user)
      subject
    end
  end

  context 'When cat is ineligible' do
    let(:eligiboolean) { false }
  end
end