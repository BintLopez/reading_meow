require 'rails_helper'
require 'reading_requests/checkout'

RSpec.describe ReadingRequests::Checkout do
  let(:request) { instance_double(BookRequest) }
  let(:library) { instance_double(Library, return_window_days: 14) }
  let(:books)   { [damaged_book, new_book] }

  let(:damaged_book) { instance_double(Book, condition: 'damaged') }
  let(:new_book)     { instance_double(Book, condition: 'new') }
  let(:checkout)     { instance_double(Checkout) }
  
  let(:today) { Date.new(2018,1,1) }

  subject do
    described_class.call(books: books, request: request, library: library)
  end

  before do
    allow(Date).to receive(:current) { today }
  end
  
  it "creates a Checkout and a BookCheckout for each book" do
    expect(Checkout)
      .to receive(:create)
      .with(
        library: library,
        book_request: request,
        return_due_date: today + library.return_window_days
      ).and_return(checkout)
    expect(BookCheckout)
      .to receive(:create)
      .once
      .with(
        book: damaged_book,
        checkout: checkout,
        action: 'checkout',
        eff_date: today,
        condition: 'damaged'
      )
    expect(BookCheckout)
      .to receive(:create)
      .once
      .with(
        book: new_book,
        checkout: checkout,
        action: 'checkout',
        eff_date: today,
        condition: 'new'
      )
    subject
  end
end