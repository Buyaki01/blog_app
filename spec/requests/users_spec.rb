require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET users' do
    before(:each) { get '/' }
    it 'Should render index template' do
      expect(response).to render_template('users/index')
    end

    before(:each) { get '/users/:user_id' }
    it 'Should render show template' do
      expect(response).to render_template('users/show')
    end
  end
end
