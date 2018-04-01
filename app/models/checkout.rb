class Checkout < ApplicationRecord
  belongs_to :library
  belongs_to :book_request
  has_many :book_checkouts
  has_many :books, through: :book_checkouts
end