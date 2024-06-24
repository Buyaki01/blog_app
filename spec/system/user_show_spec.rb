require 'rails_helper'

RSpec.describe 'Users show page', type: :feature do
  before :each do
    @user1 = User.create!(
      name: 'King',
      photo: 'https://monstar-lab.com/global/wp-content/uploads/sites/11/2019/04/male-placeholder-image.jpeg',
      bio: 'Dancer',
      posts_counter: 0,
      email: 'king@example.com',
      password: 'king123'
    )

    visit '/users/sign_in'
    fill_in 'Email', with: 'king@example.com'
    fill_in 'Password', with: 'king123'
    click_button 'Log in'

    @post1 = @user1.posts.create!(title: 'Dancing', text: 'Dancing is my hobby', comments_counter: 0, likes_counter: 0)
    @post2 = @user1.posts.create!(
      title: 'Zumba',
      text: 'Dancing Zumba helps me keep fit',
      comments_counter: 0,
      likes_counter: 0
    )

    @post3 = @user1.posts.create!(
      title: 'Salsa',
      text: 'Salsa dancing is a good way to unwing your mind after a long day of work',
      comments_counter: 0,
      likes_counter: 0
    )

    visit user_path(@user1)
  end

  it "should have the user's profile picture" do
    expect(page).to have_css("img[src*='https://monstar-lab.com/global/wp-content/uploads/sites/11/2019/04/male-placeholder-image.jpeg']")
  end

  it "should be able to see user's name" do
    expect(page).to have_content('King')
  end

  it 'should display the number of posts' do
    user = User.first
    expect(page).to have_content(user.posts_counter)
  end

  it "should display the user's bio" do
    expect(page).to have_content('Dancer')
  end

  it "should display the user's first 3 posts" do
    expect(@user1.fetch_three_recent_posts.length).to eq(3)
  end

  it 'should have a button with see all posts' do
    expect(page).to have_button('See all posts')
  end

  it "should redirect to post's show page when i click on a post" do
    click_link 'Zumba'
    expect(current_path).to eq(user_posts_path(@user1))
  end

  it "should display a button that let's you view all user's posts" do
    click_link 'See all posts'
    expect(current_path).to eq(user_posts_path(@user1))
  end
end
