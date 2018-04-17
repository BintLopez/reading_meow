# TODO -- convert this to a verbalize interactor
# gem 'verbalize'
# Read more about the Verbalize gem here:  https://github.com/taylorzr/verbalize

module ReadingRequests
  class Accept
    def self.call(initiated_request:, wrangler:)
      new(initiated_request: initiated_request, wrangler: wrangler).call
    end

    def initialize(initiated_request:, wrangler:)
      @initiated_request = initiated_request
      @wrangler = wrangler
    end

    attr_reader :initiated_request, :wrangler

    def call
      return if request_already_accepted?

      initiated_request.update!(
        cat_reading_wrangler: wrangler,
        accepted_at: Time.current,
        delivery_date: expected_delivery_date
      )
    end

    private

    def request_already_accepted?
      !!initiated_request.accepted_at
    end

    def expected_delivery_date
      Date.current + initiated_request.urgency_num_days
    end
  end
end