FactoryBot.define do
  factory :book do
    author "MyString"
    title "MyString"
    library { Library.new }
    status "MyString"
    condition "MyString"
  end
end
