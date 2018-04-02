require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to have_one(:cat) }
  it { is_expected.to have_one(:cat_reading_wrangler) }
  it { is_expected.to have_many(:contacts) }
end
