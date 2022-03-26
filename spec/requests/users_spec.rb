require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET users' do
    before(:each) { get '/users' }
    it 'Should render index template' do
      expect(response).to render_template('users/index')
    end

    it 'Should be 200' do
      expect(response).to have_http_status(:ok)
    end

    it 'should test placeholder text inside template' do
      expect(response.body).to include('Users#index')
    end
  end

  describe 'GET users' do
    before(:each) { get '/users/2' }
    it 'Should render show template' do
      expect(response).to render_template('users/show')
    end

    it 'Should be 200' do
      expect(response).to have_http_status(:ok)
    end

    it 'should test placeholder text inside template' do
      expect(response.body).to include('Users#show')
    end
  end
end
