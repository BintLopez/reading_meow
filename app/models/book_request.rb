class BookRequest < ApplicationRecord
	belongs_to :cat
	belongs_to :cat_reading_wrangler, optional: true
  has_one :checkout

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

  def cancelable?
    Date.current < delivery_date
  end

	def urgency_num_days
		@urgency_num_days ||= URGENCY_TO_DAYS.fetch(request_data["urgency"].to_sym)
	end
end