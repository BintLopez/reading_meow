module Notifiers
	class Notify
		def self.call(to:)
			new(to: to)
		end

		def initialize(to:)
			@to = to
		end

		attr_reader :to

		def call
			# Implement mail send or text message
		end
	end
end
