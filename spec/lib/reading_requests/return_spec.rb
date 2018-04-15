require 'rails_helper'
require 'reading_requests/return'

RSpec.describe ReadingRequests::Return do
  let(:request)  { instance_double(BookRequest, checkout: checkout) }
  let(:checkout) do
    instance_double(Checkout,
      books: [book1, book2, book3],
      book_checkouts: book_checkouts
    )
  end
  
  let(:book_checkouts) do
    [
      instance_double(BookCheckout, book: book1),
      instance_double(BookCheckout, book: book2),
      instance_double(BookCheckout, book: book3)
    ]
  end

  let(:book1) { instance_double(Book, id: 21, condition: 'damaged') }
  let(:book2) { instance_double(Book, id: 32, condition: 'slightly_worn') }
  let(:book3) { instance_double(Book, id: 51, condition: 'new') }

  let(:books_condition_data) do
    {
      21 => 'damaged',
      32 => 'slightly_worn',
      50 => 'slightly_worn'
    }
  end

  let(:today)      { Date.new(2018,3,17) }
  let!(:right_now) { Time.now }

  before do
    allow(Date).to receive(:current).and_return(today)
    allow(Time).to receive(:current).and_return(right_now)
  end

  subject { described_class.call(request: request, books_condition_data: books_condition_data) }

  it 'updates the request, its checkout, and book checkouts' do
    expect(book1).to receive(:update!).with(condition: 'damaged')
    expect(book2).to receive(:update!).with(condition: 'slightly_worn')
    expect(book3).not_to receive(:update!)

    book_checkouts.each do |bc|
      expect(bc)
        .to receive(:update!)
        .with(
          eff_date: today,
          action: 'return',
          condition: bc.book.condition
        )
    end

    expect(request).to receive(:update!).with(status: 'returned')
    expect(checkout).to receive(:update!).with(returned_at: right_now)
    
    expect(subject).to be_success
  end
end