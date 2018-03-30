require 'rails_helper'

RSpec.describe Library, type: :model do
  it { is_expected.to have_many(:contacts) }
end
