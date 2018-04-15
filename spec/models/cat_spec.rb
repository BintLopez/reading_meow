require 'rails_helper'

RSpec.describe Cat, type: :model do
  it { is_expected.to belong_to(:user) }

  it "has a valid factory" do
    cat = FactoryBot.create(:cat)
    expect(cat).to be_valid
    expect(cat).to be_persisted
  end
end
