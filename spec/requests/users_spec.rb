# frozen_string_literal: true

require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe '/users', type: :request do
  # This should return the minimal set of attributes required to create a valid
  # User. As you add validations to User, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    { name: 'John', last_name: 'Doe', email: 'john.doe@example.com', contact_number: '123456789', blood_group: 'O',
      company_name: 'Example Company', password: '123456789', password_confirmation: '123456789' }
  end

  let(:invalid_attributes) do
    { name: '', last_name: '', email: 'invalid_email', contact_number: '', blood_group: 'Invalid Blood Group',
      company_name: '', password: '123456789', password_confirmation: '123456789' }
  end
  let(:new_attributes) do
    { name: 'moarlo', last_name: 'jison', email: 'moarlo.jison@example.com', contact_number: '9876543210',
      blood_group: '1', company_name: 'Company', password: '123456789', password_confirmation: '123456789' }
  end

  describe 'GET /index' do
    context 'when user is not signed in' do
      it 'redirects to the sign-in page' do
        get users_path
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context 'when user is signed in' do
      before do
        # Sign in a user before making the request
        user =  User.create! valid_attributes # Assuming you have a User factory with FactoryBot
        sign_in user
      end

      it 'renders a successful response' do
        get users_path
        expect(response).to have_http_status(200)
      end
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      user = User.create! valid_attributes
      sign_in user
      get user_url(user)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      user = User.create! valid_attributes
      sign_in user
      get new_user_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'renders a successful response' do
      user = User.create! valid_attributes
      sign_in user
      get edit_user_url(user)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new User' do
        expect do
          post users_url, params: { user: valid_attributes }
        end.to change(User, :count).by(1)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new User' do
        expect do
          post users_url, params: { user: invalid_attributes }
        end.to change(User, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post users_url, params: { user: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PATCH/update' do
    context 'with valid parameters' do
      it 'updates the requested user' do
        user = User.create! valid_attributes
        sign_in user
        patch user_url(user), params: { user: new_attributes }
        expect(response).to have_http_status(:found)
        expect(response).to redirect_to(user)
        user.reload
        expect(user.name).to eq(new_attributes[:name])
        expect(user.email).to eq(new_attributes[:email])
      end
      it 'redirects to the user' do
        user = User.create! valid_attributes
        sign_in user
        patch user_url(user), params: { user: new_attributes }
        user.reload
        expect(response).to redirect_to(user_url(user))
      end
    end

    context 'with invalid parameters' do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        user = User.create! valid_attributes
        sign_in user
        patch user_url(user), params: { user: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested user' do
      user = User.create! valid_attributes
      sign_in user
      expect do
        delete user_url(user)
      end.to change(User, :count).by(-1)
    end

    it 'redirects to the users list' do
      user = User.create! valid_attributes
      sign_in user
      delete user_url(user)
      expect(response).to redirect_to(users_url)
    end
  end
end
