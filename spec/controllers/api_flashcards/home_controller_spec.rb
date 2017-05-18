require 'rails_helper'

module ApiFlashcards
  RSpec.describe HomeController, type: :controller do
    routes { ApiFlashcards::Engine.routes }

    describe 'GET #index' do
      it 'successful' do
        user = 'admin'
        password = 'password'
        request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials(user,
                                                                                                           password)
        get :index
        expect(response).to have_http_status(:success)
      end

      it 'unauthorized without user name and password' do
        get :index
        expect(response.status).to eq 401
      end

      it 'unauthorized with user name and password' do
        request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials('foo',
                                                                                                           'bar')
        get :index
        expect(response.status).to eq 401
      end
    end
  end
end
