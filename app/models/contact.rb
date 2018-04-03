class Contact < ApplicationRecord
  belongs_to :contactable, polymorphic: true
end
