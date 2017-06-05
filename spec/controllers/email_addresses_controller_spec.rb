require 'rails_helper'

RSpec.describe EmailAddressesController, type: :controller do

  let(:valid_attributes) {
    { address: 'alicesmith@mail.com', person_id: 1 }
  }

  let(:invalid_attributes) {
    { address: nil, person_id: 1 }
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      email_address = EmailAddress.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      email_address = EmailAddress.create! valid_attributes
      get :show, params: {id: email_address.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      email_address = EmailAddress.create! valid_attributes
      get :edit, params: {id: email_address.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      let(:alice) { Person.create(first_name: 'Alice', last_name: 'Smith') }
      let(:valid_attributes) { { address: 'alicesmith@mail.com', person_id: alice.id } }
      it "creates a new EmailAddress" do
        expect {
          post :create, params: {email_address: valid_attributes}, session: valid_session
        }.to change(EmailAddress, :count).by(1)
      end

      it "redirects to the created email_address" do
        post :create, params: {email_address: valid_attributes}, session: valid_session
        expect(response).to redirect_to(alice)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {email_address: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:bob) { Person.create(first_name: 'Bob', last_name: 'Jones') }
      let(:valid_attributes) { { address: 'bob@mail.com', person_id: bob.id } }
      let(:new_attributes) {
        { email_address: 'bob@mail.com', person_id: bob.id }
      }

      it "updates the requested email_address" do
        email_address = EmailAddress.create! valid_attributes
        put :update, params: {id: email_address.to_param, email_address: new_attributes}, session: valid_session
        email_address.reload
        expect(email_address.address).to eq('bob@mail.com')
        expect(email_address.person_id).to eq(1)
      end

      it "redirects to the email_address" do
        email_address = EmailAddress.create! valid_attributes
        put :update, params: {id: email_address.to_param, email_address: valid_attributes}, session: valid_session
        expect(response).to redirect_to(email_address)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        email_address = EmailAddress.create! valid_attributes
        put :update, params: {id: email_address.to_param, email_address: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested email_address" do
      email_address = EmailAddress.create! valid_attributes
      expect {
        delete :destroy, params: {id: email_address.to_param}, session: valid_session
      }.to change(EmailAddress, :count).by(-1)
    end

    it "redirects to the email_addresses list" do
      email_address = EmailAddress.create! valid_attributes
      delete :destroy, params: {id: email_address.to_param}, session: valid_session
      expect(response).to redirect_to(email_addresses_url)
    end
  end

end
