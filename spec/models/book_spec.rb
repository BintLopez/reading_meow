require 'rails_helper'

RSpec.describe Book, type: :model do
  it 'has a valid factory' do
    factory = FactoryBot.create
    expect(factory).to be_valid
    expect(factory).to be_persisted
  end
end
