require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to have_one(:cat) }
  it { is_expected.to have_one(:cat_reading_wrangler) }
  it { is_expected.to have_many(:contacts) }

  describe "#role" do
  	let(:user) { FactoryBot.create(:user) }

  	context "When the user has a cat" do
  		before { FactoryBot.create(:cat, user: user) }
  		
  		it "returns cat" do
  			expect(user.role).to eq("cat")
  		end
  	end

  	context "When the user has a cat reading wrangler" do
  		before { FactoryBot.create(:cat_reading_wrangler, user: user) }

  		it "returns wrangler" do
  			expect(user.role).to eq("wrangler")
  		end
  	end

  	context "When the user has no associated cat_reading_wrangler or cat record" do
  		context "When the user account_type is 'cat'" do
  			it "returns cat" do

  			end
  		end

  		context "When the user account_type is 'wrangler'" do
  			it "returns wrangler" do

  			end
  		end

  		context "And admin is true" do
  			it "returns admin" do

  			end
  		end

  		context "And admin is false" do
  			it "raises an error that the user role is unknown" do

  			end
  		end
  	end
  end
end


