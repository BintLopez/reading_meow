require 'rails_helper'

RSpec.describe Book, type: :model do
  it "has a valid factory" do
  	book = FactoryBot.create(:book)
  	expect(book).to be_valid
  end
end
