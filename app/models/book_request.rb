class BookRequest < ApplicationRecord
	belongs_to :cat
	belongs_to :cat_reading_wrangler
end
