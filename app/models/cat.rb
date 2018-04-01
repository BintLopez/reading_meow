class Cat < ApplicationRecord
  belongs_to :user
  has_many :book_requests

  def current_book_request
  	# TODO -- add a test to cover this
  	# Bonus points...
  	# 1. move this into a scope on BookRequest
  	# 2. stub out the response to BookRequest.current_live
  	@current_book_request ||= book_requests.where(status: BookRequest::LIVE_STATUSES).last
  end
end
