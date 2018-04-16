require 'json'

class BookRequest < ApplicationRecord
	belongs_to :cat
	belongs_to :cat_reading_wrangler

  STATUSES = {
    initiated:   'initiated',
    accepted:    'accepted',
    checked_out: 'checked_out',
    delivered:   'delivered',
    picked_up:   'picked_up',
    returned:    'returned',
    canceled:    'canceled'
  }.freeze

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
end
