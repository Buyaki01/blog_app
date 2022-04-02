require 'rails_helper'

RSpec.describe Like, type: :model do
  it 'tests that Like model is created correctly' do
    like = Like.new
    like.build_author(name: 'Ritta')
    like.build_post(text: '')
    expect(like).to be_valid
  end

  it 'updates a posts likes correctly' do
    user = User.create(name: 'Tom', posts_counter: 0)
    post = user.posts.create(title: 'Post1', text: 'This is a post', likes_counter: 1, comments_counter: 0)
    post.likes.create(author_id: user.id, post_id: post.id)
    expect(post.likes_counter).to eql(1)
  end
end
