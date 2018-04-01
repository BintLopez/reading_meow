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
end