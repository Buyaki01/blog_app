require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET posts' do
    before(:each) { get '/users/:user_id/posts' }
    it 'Should render a template' do
      expect(response).to render_template('posts/index')
    end
  end
end
