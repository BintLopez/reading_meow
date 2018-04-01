class BookCheckout < ApplicationRecord
	belongs_to :book
	belongs_to :checkout
end
