require 'rails_helper'
RSpec.describe 'Posts show page', type: :feature do
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
    visit '/users/sign_in'
    fill_in 'Email', with: 'king@example.com'
    fill_in 'Password', with: 'king123'
    click_button 'Log in'
    @post1 = @user1.posts.create!(title: 'Dancing', text: 'Dancing is my hobby', comments_counter: 0, likes_counter: 0)
    @post1.comments.create!(author: @user2, text: 'Woow!')
    @post1.comments.create!(author: @user1, text: 'Same to me')
    @post1.comments.create!(author: @user2, text: 'so true')
    @post1.comments.create!(author: @user1, text: 'Amazing!')
    @post1.comments.create!(author: @user2, text: 'Awesome!')
    @post1.comments.create!(author: @user1, text: 'Perfect!')
    @post1.likes.create!(author: @user1)
    @post1.likes.create!(author: @user2)
    visit user_posts_path(@user1)
  end
  it "should show the post's title" do
    expect(page).to have_content('Dancing')
  end
  it "should show the post's author" do
    expect(page).to have_content('Jane')
  end
  it 'should display the how many comments a post has' do
    expect(page).to have_content('Comments: 6')
  end
  it 'should display the number of likes a post has' do
    expect(page).to have_content('Likes: 2')
  end
  it "should display some of the post's body" do
    expect(page).to have_content('Dancing is my hobby')
  end
  it 'should display the username of each commenter on the post' do
    expect(page).to have_content('Jane')
    expect(page).to have_content('King')
  end
  it 'should display the comment each commentor left' do
    expect(page).to have_content('Woow!')
    expect(page).to have_content('Same to me')
  end
end
