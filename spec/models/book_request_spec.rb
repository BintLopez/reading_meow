require 'rails_helper'

RSpec.describe BookRequest, type: :model do
  it { is_expected.to belong_to(:cat) }
  it { is_expected.to belong_to(:cat_reading_wrangler) }
end
