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

  describe 'class method vs scope' do
    let(:scope_results) { BookRequest.outstanding_scope }
    let(:class_results) { BookRequest.outstanding_class }

    context 'when the results are present' do
      let!(:book_request_1) { FactoryBot.create(:book_request, delivered_at: Time.current, accepted_at: Time.current, status: 'delivered') }
      let!(:book_request_2) { FactoryBot.create(:book_request, delivered_at: Time.current, accepted_at: Time.current, status: 'delivered') }

      it 'class method and scope are the same' do
        expect(scope_results.count).to be > 0
        expect(scope_results.class).to eq(class_results.class)
      end
    end

    context 'when results are not present' do
      it 'class method and scope are the same' do
        expect(scope_results.count).to eq(0)
        expect(scope_results.class).to eq(class_results.class)
      end
    end
  end

  describe 'request_data setter' do
    # TODO -- test me please!
  end

  describe 'request_data getter' do
    # TODO -- test me please!
  end
end
