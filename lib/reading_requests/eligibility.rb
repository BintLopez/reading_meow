module ReadingRequests
	class Eligibility

		def self.call(cat:)
			if !cat.is_a? Cat
				raise ArgumentError.new("Expecting a cat, got #{cat}.class")
			end

			new(cat: cat).call
		end

		def initialize(cat:)
			@cat = cat
		end

		attr_reader :cat

		def call
			#  * do they already have books out?
			#  * do they have any unpaid fines?
			#  * have they damaged too many past books?
		end
	end
end