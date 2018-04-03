class Book < ApplicationRecord
  belongs_to :library
  has_many :book_checkouts
  has_many :checkouts, through: :book_checkouts
end
