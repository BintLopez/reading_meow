require 'rails_helper'
require 'reading_requests/cancel'

RSpec.describe ReadingRequests::Cancel do
  let(:requestor) { instance_double(User, can_cancel?: requestor_can_cancel) }
  let(:request)   { instance_double(BookRequest, cancelable?: request_cancelable) }

  subject do
    described_class.call(requestor: requestor, request: request)
  end

  context "When the requestor cannot cancel the request" do
    let(:requestor_can_cancel) { false }
    let(:request_cancelable)   { true }

    it "does not cancel the request" do
      expect(request).not_to receive(:update!)
      subject
    end
  end

  context "When the requestor can cancel the request" do
    let(:requestor_can_cancel) { true }

    context "and the request is cancelable" do
      let(:request_cancelable) { true }

      it "updates the request to cancelled status" do
        expect(request)
          .to receive(:update!)
          .with(status: "canceled")
        subject
      end
    end

    context "but the request is NOT cancelable" do
      let(:request_cancelable) { false }

      it "does not cancel the request" do
        expect(request).not_to receive(:update!)
        subject
      end
    end
  end
end