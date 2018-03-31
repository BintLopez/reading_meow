require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to have_many(:cats) }
  it { is_expected.to have_many(:contacts) }
  it { is_expected.to have_one(:cat_reading_wrangler) }

  it 'works' do
  end
end


