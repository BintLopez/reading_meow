require 'rails_helper'

RSpec.describe CatReadingWrangler, type: :model do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to have_many(:book_requests) }
end
