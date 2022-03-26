require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET posts' do
    before(:each) { get '/users/:user_id/posts' }
    it 'Should render a template' do
      expect(response).to render_template('posts/index')
    end

    it 'Should be 200' do
      expect(response).to have_http_status(:ok)
    end

    it 'should test placeholder text inside template' do
      expect(response.body).to include('Posts#index')
    end
  end

  describe 'GET posts' do
    before(:each) { get '/users/:user_id/posts/2' }
    it 'Should render show template' do
      expect(response).to render_template('posts/show')
    end

    it 'Should be 200' do
      expect(response).to have_http_status(:ok)
    end

    it 'should test placeholder text inside template' do
      expect(response.body).to include('Posts#show')
    end
  end
end
