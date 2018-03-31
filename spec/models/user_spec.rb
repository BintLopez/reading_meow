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
  			before { user.account_type = 'cat' }

  			it "returns cat" do
  				expect(user.role).to eq("cat")
  			end
  		end

  		context "When the user account_type is 'wrangler'" do
  			before { user.account_type = 'wrangler' }

  			it "returns wrangler" do
  				expect(user.role).to eq("wrangler")
  			end
  		end

  		context "And admin is true" do
  			before { user.update_attributes(admin: true) }

  			it "returns admin" do
  				expect(user.role).to eq("admin")
  			end
  		end

  		context "And admin is false" do
  			let(:error_message) { "User #{user.id} does not have a role!" }

  			it "raises an error that the user role is unknown" do
  				expect{ user.role }.to raise_error(NotImplementedError, error_message)
  			end
  		end
  	end
  end
end


