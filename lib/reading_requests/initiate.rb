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

			request = cat.book_requests.create(
				# book request statuses const does not exist
				status: BookRequest::STATUSES[:initiated],
				request_data: request_data
			)

			::Notifiers::Notify.call(to: available_wranglers)
		end

		private

		def available_wranglers
			# this scope does not exist yet
			@available_wranglers ||= CatReadingWrangler.available
		end

	end
end