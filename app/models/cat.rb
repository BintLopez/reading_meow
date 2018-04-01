class Cat < ApplicationRecord
  belongs_to :user
  has_many :book_requests
end
