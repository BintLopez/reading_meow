require 'rails_helper'

RSpec.describe CatReadingWrangler, type: :model do
  it { is_expected.to belong_to(:library) }
  it { is_expected.to validate_presence_of(:library_card_number) }
end
