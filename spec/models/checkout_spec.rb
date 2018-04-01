require 'rails_helper'

RSpec.describe Checkout, type: :model do
  it { is_expected.to belong_to(:library) }
  it { is_expected.to belong_to(:book_request) }
  it { is_expected.to have_many(:books).through(:book_checkouts) }

  it 'has a valid factory' do
  	checkout = FactoryBot.create(:checkout)
  	expect(checkout).to be_persisted
  	expect(checkout).to be_valid
  end
end