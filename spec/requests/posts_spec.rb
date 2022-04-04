require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
  post = Post.create(author: user, title: 'Hello', text: 'This is my first post')
  describe 'GET posts' do
    before(:each) { get user_posts_path user_id: user.id }
    it 'Should render a template' do
      expect(response).to render_template('posts/index')
    end

    it 'Should be 200' do
      expect(response).to have_http_status(:ok)
    end

    it 'should test placeholder text inside template' do
      expect(response.body).to include('This is my first post')
    end
  end

  describe 'GET posts' do
    before(:each) { get user_post_path user_id: user.id, id: post.id }
    it 'Should render show template' do
      expect(response).to render_template('posts/show')
    end

    it 'Should be 200' do
      expect(response).to have_http_status(:ok)
    end

    it 'should test placeholder text inside template' do
      expect(response.body).to include('This is my first post')
    end
  end
end
