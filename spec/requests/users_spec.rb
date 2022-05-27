require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users/sign_in' do
    it 'returns http success' do
      get '/users/sign_in'
      expect(response).to have_http_status(:success)
    end

    it 'should conatain the text LOGIN' do
      get '/users/sign_in'
      expect(response.body).to include('LOGIN')
    end
  end

  describe 'GET /users/sign_up' do
    it 'returns http success' do
      get '/users/sign_up'
      expect(response).to have_http_status(:success)
    end

    it 'should conatain the text REGISTER' do
      get '/users/sign_up'
      expect(response.body).to include('REGISTER')
    end
  end
end
