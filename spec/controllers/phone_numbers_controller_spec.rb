require 'rails_helper'

RSpec.describe PhoneNumbersController, type: :controller do

  let(:valid_attributes) {
    { number: "MyString", person_id: 1 }
  }

  let(:invalid_attributes) {
    { number: nil, person_id: nil }
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      phone_number = PhoneNumber.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      phone_number = PhoneNumber.create! valid_attributes
      get :show, params: {id: phone_number.to_param}, session: valid_session
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
      phone_number = PhoneNumber.create! valid_attributes
      get :edit, params: {id: phone_number.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do

      let(:alice) { Person.create(first_name: 'Alice', last_name: 'Smith') }
      let(:valid_attributes) { {number: '555-1234', person_id: alice.id} }

      it "creates a new PhoneNumber" do
        expect {
          post :create, params: {phone_number: valid_attributes}, session: valid_session
        }.to change(PhoneNumber, :count).by(1)
      end

      it "redirects to the phone number's person" do
        alice = Person.create(first_name: 'Alice', last_name: 'Smith')
        valid_attributes = { number: '555-8888', person_id: alice.id }
        post :create, params: {phone_number: valid_attributes}, session: valid_session
        expect(response).to redirect_to(alice)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {phone_number: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { number: 'MyNewString', person_id: 2 }
      }

      it "updates the requested phone_number" do
        phone_number = PhoneNumber.create! valid_attributes
        put :update, params: {id: phone_number.to_param, phone_number: new_attributes}, session: valid_session
        phone_number.reload
        expect(phone_number.number).to eq('MyNewString')
        expect(phone_number.person_id).to eq(2)
      end

      it "redirects to the phone_number" do
        phone_number = PhoneNumber.create! valid_attributes
        put :update, params: {id: phone_number.to_param, phone_number: valid_attributes}, session: valid_session
        expect(response).to redirect_to(phone_number)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        phone_number = PhoneNumber.create! valid_attributes
        put :update, params: {id: phone_number.to_param, phone_number: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested phone_number" do
      phone_number = PhoneNumber.create! valid_attributes
      expect {
        delete :destroy, params: {id: phone_number.to_param}, session: valid_session
      }.to change(PhoneNumber, :count).by(-1)
    end

    it "redirects to the phone_numbers list" do
      phone_number = PhoneNumber.create! valid_attributes
      delete :destroy, params: {id: phone_number.to_param}, session: valid_session
      expect(response).to redirect_to(phone_numbers_url)
    end
  end

end
