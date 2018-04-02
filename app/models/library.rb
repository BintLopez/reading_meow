class Library < ApplicationRecord
  has_many :contacts, as: :contactable
end