class CatReadingWrangler < ApplicationRecord
  belongs_to :user
  has_many :book_requests

  scope :available, ->{ where(available: true) }
end
