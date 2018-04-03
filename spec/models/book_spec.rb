require 'rails_helper'

RSpec.describe Book, type: :model do
  it { is_expected.to belong_to(:library) }
  it { is_expected.to have_many(:checkouts).through(:book_checkouts) }

  it 'has a valid factory' do
    factory = FactoryBot.create(:book)
    expect(factory).to be_valid
    expect(factory).to be_persisted
  end
end
