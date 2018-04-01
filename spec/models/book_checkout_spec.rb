require 'rails_helper'

RSpec.describe BookCheckout, type: :model do
  it { is_expected.to belong_to(:book) }
  it { is_expected.to belong_to(:check_out) }
end
