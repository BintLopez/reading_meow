FactoryBot.define do
  factory :check_out do
  	library { FactoryBot.create(:library) }
  	book_request { FactoryBot.create(:book_request) }
    return_due_date "2018-03-31"
    returned_at "2018-03-31 23:05:47"
  end
end
