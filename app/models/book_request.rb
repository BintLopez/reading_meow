require 'json'

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

  scope :outstanding_scope, ->{ where.not(delivered_at: nil, accepted_at: nil).where(status: STATUSES[:delivered], picked_up_at: nil) }

  def self.outstanding_class
    where.not(delivered_at: nil, accepted_at: nil).where(status: 'incomplete', picked_up_at: nil)
  end

  # Overwriting the reqeust_data getter and setter
  # to enforce a json data type for this column.
  # Unlike postgres, sqlite3 does not have json
  # columns out of the box, so needed to implement.

  # TODO -- clever code like this that handles
  # an important responsibility like data integrity
  # should really warrant a test... if you're reading
  # this... please add tests for the two methods below!
  def request_data=(value)
	  raise ArgumentError.new("BookRequest#request_data must be a Hash") unless value.is_a? Hash
	  value = JSON.generate(value)
	  super
  end

  def request_data
    return {} unless read_attribute(:request_data).present?
    JSON.parse(read_attribute(:request_data))
  end

  def cancelable?
    Date.current < delivery_date
  end

  def urgency_num_days
    @urgency_num_days ||= URGENCY_TO_DAYS.fetch(request_data["urgency"].to_sym)
  end
end