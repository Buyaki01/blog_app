require 'rails_helper'

RSpec.describe 'Users index page', type: :system do
  before :each do
    @user1 = User.create!(
      name: 'King',
      photo: 'https://monstar-lab.com/global/wp-content/uploads/sites/11/2019/04/male-placeholder-image.jpeg',
      bio: 'Dancer',
      posts_counter: 0,
      email: 'king@example.com',
      password: 'king123'
    )
    @user2 = User.create!(email: 'janedoe@gmail.com', password: '123abc', name: 'Jane', bio: 'Lorem Ipsum...', photo: 'https://monstar-lab.com/global/wp-content/uploads/sites/11/2019/04/male-placeholder-image.jpeg')
    @user3 = User.create!(email: 'peter@gmail.com', password: '123abc', name: 'Peter', bio: 'Lorem Ipsum...', photo: 'https://monstar-lab.com/global/wp-content/uploads/sites/11/2019/04/male-placeholder-image.jpeg')

    visit '/users/sign_in'
    fill_in 'Email', with: 'king@example.com'
    fill_in 'Password', with: 'king123'
    click_button 'Log in'

    @user1.posts.create!(
      title: 'Dancing',
      text: 'Dancing is my hobby',
      comments_counter: 0,
      likes_counter: 0
    )
    @user1.posts.create!(
      title: 'Zumba',
      text: 'Dancing Zumba helps me keep fit',
      comments_counter: 0,
      likes_counter: 0
    )
    visit '/users'
  end
  it 'should have user profile image' do
    all('img').each do |i|
      expect(i[:src]).to eq('https://monstar-lab.com/global/wp-content/uploads/sites/11/2019/04/male-placeholder-image.jpeg')
    end
  end

  it 'should have number of posts' do
    all(:css, '.num_post').each { |post| expect(post).to have_content('Number of posts: 2') }
  end
end
