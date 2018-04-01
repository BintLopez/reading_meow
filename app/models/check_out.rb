class CheckOut < ApplicationRecord
  belongs_to :library
  belongs_to :book_request
end