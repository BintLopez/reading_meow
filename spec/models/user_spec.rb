require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to have_many(:cats) }
  it { is_expected.to have_many(:contacts) }

  it 'works' do
  	binding.pry
  end
end


