require 'rails_helper'

RSpec.describe 'PasswordResets', type: :request do
  describe 'GET /new' do
    it 'returns http success' do
      get '/password_resets/new'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /edit' do
    let(:user) { User.create!(email: 'to@example.org', password: 'password', reset_token: 'dummy_token') }

    it 'returns http success' do
      get edit_password_reset_path(user.reset_token)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'PATCH /update' do
    let(:user) { User.create!(email: 'to@example.org', password: 'password', reset_token: 'dummy_token') }
    let(:params) { { user: { password: 'newpassword', reset_token: user.reset_token } } }

    it 'updates the password and redirects' do
      patch(password_reset_path(user.reset_token), params:)
      expect(response).to redirect_to(root_path)
    end
  end
end
