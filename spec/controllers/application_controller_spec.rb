require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do

  describe "GET #home" do
    subject { get :home }

    context "When a user is not logged in" do
      it "returns a success response for home" do
        subject
        expect(response).to be_success
      end
    end

    context "When the user is logged in" do
      before { login_with }

      it "redirects to the dashboard" do
        expect(subject).to redirect_to(dashboard_path)
      end
    end
  end

  describe "GET #dashboard" do
    subject { get :dashboard }

    context "When a user is not logged in" do
      it "does not successfully hit the dashboard" do
        subject
        expect(response).not_to be_success
      end
    end

    context "When a user is logged in" do
      it "returns a success response" do
        subject
        expect(response).to be_redirect

        # Note both of the below work
        expect(response).to redirect_to(new_user_session_path)
        expect(response.redirect_url.end_with?(new_user_session_path)).to be true
        expect(response.redirect_url).to include(new_user_session_path)
      end
    end
  end

end
