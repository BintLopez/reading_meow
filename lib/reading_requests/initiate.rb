require 'reading_requests/eligibility'
require 'notifiers/notify'

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

			binding.pry

			request = cat.book_requests.create(
				status: BookRequest::STATUSES[:initiated],
				request_data: request_data
			)

			binding.pry

			::Notifiers::Notify.call(to: available_wranglers)
		end

		private

		def available_wranglers
			@available_wranglers ||= CatReadingWrangler.where(available: true)
		end

	end
end