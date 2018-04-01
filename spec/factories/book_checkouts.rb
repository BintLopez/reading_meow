FactoryBot.define do
  factory :book_checkout do
    book_id 1
    check_out_id 1
    checked_out_date "2018-04-01"
    returned_date "2018-04-01"
  end
end
