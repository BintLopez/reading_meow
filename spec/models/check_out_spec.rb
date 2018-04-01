require 'rails_helper'

RSpec.describe CheckOut, type: :model do
  it { is_expected.to belong_to(:library) }
  it { is_expected.to belong_to(:book_request) }
  it { is_expected.to have_many(:books).through(:book_checkouts) }

  it 'has a valid factory' do
  	check_out = FactoryBot.create(:check_out)
  	expect(check_out).to be_persisted
  	expect(check_out).to be_valid
  end
end