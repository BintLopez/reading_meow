class CatReadingWrangler < ApplicationRecord
  belongs_to :user
  has_many :book_requests

  belongs_to :library
  validates_presence_of :library_card_number
end
