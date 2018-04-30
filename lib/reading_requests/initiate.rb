require 'reading_requests/eligibility'

module ReadingRequests
  class Initiate
    def self.call(cat: , request_data:{})
	    new(cat: cat, request_data: request_data).call
    end

    def initialize(cat:, request_data:)
      @cat = cat
      @request_data = request_data
    end

    attr_reader :cat, :request_data

    def call
      return unless Eligibility.call(cat: cat)

      request = cat.book_requests.create!(
        status: BookRequest::STATUSES[:initiated],
        request_data: request_data
      )

      alert_the_wranglers!
    end

    private

    def alert_the_wranglers!
      available_wranglers.each do |wrangler|
        ReadingRequestMailer.new_request(wrangler.user).deliver_now
      end
    end

    def available_wranglers
      @available_wranglers ||= CatReadingWrangler.where(available: true)
    end

  end
end