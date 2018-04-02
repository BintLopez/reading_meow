require 'rails_helper'

RSpec.describe BookRequest, type: :model do
  it { is_expected.to belong_to(:cat) }
  it { is_expected.to belong_to(:cat_reading_wrangler) }
  it { is_expected.to have_one(:checkout) }

  it "has a valid factory" do
  	book_request = FactoryBot.create(:book_request)
  	expect(book_request).to be_persisted
  	expect(book_request).to be_valid
  end
end
