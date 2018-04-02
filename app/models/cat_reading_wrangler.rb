class CatReadingWrangler < ApplicationRecord
  belongs_to :user
  belongs_to :library
  validates_presence_of :library_card_number
end