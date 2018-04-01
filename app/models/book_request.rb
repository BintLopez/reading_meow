class BookRequest < ApplicationRecord
	belongs_to :cat
	belongs_to :cat_reading_wrangler, optional: true

	STATUSES = {
		initiated:   'initiated',
		accepted:    'accepted',
		checked_out: 'checked_out',
		delivered:   'delivered',
		picked_up:   'picked_up',
		returned:    'returned',
		canceled:    'canceled'
	}.freeze

	LIVE_STATUSES = STATUSES.except(:returned, :canceled).values.freeze

	URGENCY_TO_DAYS = {
		asap: 2,
		regular: 5,
		low: 10
	}
end