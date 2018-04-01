require 'rails_helper'

RSpec.describe CatsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Cat. As you add validations to Cat, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  let(:current_user) { FactoryBot.create(:user) }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # CatsController. Be sure to keep this updated too.
  let(:valid_session) { { current_user_id: current_user.id } }

  before { login_with(current_user) }

  describe "GET #index" do
    subject { get :index, params: {}, session: valid_session }

    context "When the user is an admin" do
      before { current_user.update!(admin: true) }

      it "returns a success response" do
        expect(Cat).to receive(:all)
        expect(response).to be_success
      end
    end

    context "When the user is a cat reading wrangler" do
      it "returns the cats the wrangler has/will get books to" do
        skip("Implement me after you build out relationships between wranglers and cats")
      end
    end

    context "When the user is a cat" do
      let(:current_user) { FactoryBot.create(:cat).user }

      it "redirects to the cat's profile (show)" do
        expect(Cat).not_to receive(:all)
        expect(response).to redirect_to(cat_path(current_user.cat))
      end
    end
  end

  describe "GET #show" do
    context "when the user is an admin" do

    end

    context "when the user is a cat" do
      context "and the cat's account is the one being shown" do
        it "returns a success response rendering the cat's account" do
          cat = Cat.create! valid_attributes
          get :show, params: {id: cat.to_param}, session: valid_session
          expect(response).to be_success
        end
      end

      context "and the cat's account is not the one passed into show" do
        it "redirects to the logged in cat's account" do

        end
      end
    end
  end

  describe "GET #new" do
    context "when the user is an admin" do
      it "returns a success response" do
        get :new, params: {}, session: valid_session
        expect(response).to be_success
      end
    end

    context "when the user is a cat reading wrangler" do
      it "redirects to cat#index" do

      end
    end

    context "when the user has the cat role" do
      context "but does not yet have a cat" do
        it "returns a success response" do
          get :new, params: {}, session: valid_session
          expect(response).to be_success
        end
      end

      context "and already has a cat record" do
        it "redirects to update" do

        end
      end
    end
  end

  describe "GET #edit" do
    context "when the user is an admin" do
      it "returns a success response" do
        get :edit, params: {id: cat.to_param}, session: valid_session
        expect(response).to be_success
      end
    end

    context "when the user is a cat reading wrangler" do
      it "redirects to cat#index" do

      end
    end

    context "when the user has the cat role" do
      context "and the id param is for the cat" do
        it "returns a success response" do
          get :edit, params: {id: cat.to_param}, session: valid_session
          expect(response).to be_success
        end
      end

      context "and the id param is for a different cat" do
        it "redirects to update for the id of the current user's cat" do

        end
      end
    end
  end

  describe "POST #create" do
    context "when the user is an admin" do
      context "with valid params" do
        it "creates a new Cat" do
          expect {
            post :create, params: {cat: valid_attributes}, session: valid_session
          }.to change(Cat, :count).by(1)
        end

        it "redirects to the created cat" do
          post :create, params: {cat: valid_attributes}, session: valid_session
          expect(response).to redirect_to(Cat.last)
        end
      end

      context "with invalid params" do
        it "returns a success response (i.e. to display the 'new' template)" do
          post :create, params: {cat: invalid_attributes}, session: valid_session
          expect(response).to be_success
        end
      end
    end

    context "when the user is a cat reading wrangler" do
      it "redirects to cat#index" do

      end
    end

    context "when the user has the cat role" do
      context "but does not yet have a cat" do
        context "with valid params" do
          it "creates a new Cat" do
            expect {
              post :create, params: {cat: valid_attributes}, session: valid_session
            }.to change(Cat, :count).by(1)
          end

          it "redirects to the created cat" do
            post :create, params: {cat: valid_attributes}, session: valid_session
            expect(response).to redirect_to(Cat.last)
          end
        end

        context "with invalid params" do
          it "returns a success response (i.e. to display the 'new' template)" do
            post :create, params: {cat: invalid_attributes}, session: valid_session
            expect(response).to be_success
          end
        end
      end

      context "and already has a cat record" do
        it "redirects to update" do

        end
      end
    end
  end

  describe "PUT #update" do
    context "when the user is an admin" do
      context "with valid params" do
        let(:new_attributes) {
          skip("Add a hash of attributes valid for your model")
        }

        it "updates the requested cat" do
          cat = Cat.create! valid_attributes
          put :update, params: {id: cat.to_param, cat: new_attributes}, session: valid_session
          cat.reload
          skip("Add assertions for updated state")
        end

        it "redirects to the cat" do
          cat = Cat.create! valid_attributes
          put :update, params: {id: cat.to_param, cat: valid_attributes}, session: valid_session
          expect(response).to redirect_to(cat)
        end
      end

      context "with invalid params" do
        it "returns a success response (i.e. to display the 'edit' template)" do
          cat = Cat.create! valid_attributes
          put :update, params: {id: cat.to_param, cat: invalid_attributes}, session: valid_session
          expect(response).to be_success
        end
      end
    end

    context "when the user is a cat" do
      context "and is trying to update its own account" do
        context "with valid params" do
          let(:new_attributes) {
            skip("Add a hash of attributes valid for your model")
          }

          it "updates the requested cat" do
            cat = Cat.create! valid_attributes
            put :update, params: {id: cat.to_param, cat: new_attributes}, session: valid_session
            cat.reload
            skip("Add assertions for updated state")
          end

          it "redirects to the cat" do
            cat = Cat.create! valid_attributes
            put :update, params: {id: cat.to_param, cat: valid_attributes}, session: valid_session
            expect(response).to redirect_to(cat)
          end
        end

        context "with invalid params" do
          it "returns a success response (i.e. to display the 'edit' template)" do
            cat = Cat.create! valid_attributes
            put :update, params: {id: cat.to_param, cat: invalid_attributes}, session: valid_session
            expect(response).to be_success
          end
        end
      end

      context "and is trying to update another cat's account" do
        it "redirects" do

        end
      end
    end

    context "when the user is a cat reading wrangler" do
      it "redirects to cat#index" do

      end
    end
  end

  describe "DELETE #destroy" do
    context "when the user is an admin" do
      it "destroys the requested cat" do
        cat = Cat.create! valid_attributes
        expect {
          delete :destroy, params: {id: cat.to_param}, session: valid_session
        }.to change(Cat, :count).by(-1)
      end

      it "redirects to the cats list" do
        cat = Cat.create! valid_attributes
        delete :destroy, params: {id: cat.to_param}, session: valid_session
        expect(response).to redirect_to(cats_url)
      end
    end

    context "when the user is a cat" do
      context "attempting to delete its own account" do
        it "destroys the requested cat" do
          cat = Cat.create! valid_attributes
          expect {
            delete :destroy, params: {id: cat.to_param}, session: valid_session
          }.to change(Cat, :count).by(-1)
        end

        it "redirects to the cats list" do
          cat = Cat.create! valid_attributes
          delete :destroy, params: {id: cat.to_param}, session: valid_session
          expect(response).to redirect_to(cats_url)
        end
      end

      context "attempting to delete another cats account" do
        it "displays an alert, redirects" do

        end
      end
    end

    context "when the user is a cat reading wrangler" do
      it "redirects to cat#index" do

      end
    end
  end

end
