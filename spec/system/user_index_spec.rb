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

  it 'should have all usernames for all users' do
    expect(page).to have_css('h2', text: 'King')
    expect(page).to have_css('h2', text: 'Jane')
    expect(page).to have_css('h2', text: 'Peter')
  end

  it 'should have user profile image' do
    expect(page).to have_css("img[src*='https://monstar-lab.com/global/wp-content/uploads/sites/11/2019/04/male-placeholder-image.jpeg']")
    expect(page).to have_css("img[src*='https://monstar-lab.com/global/wp-content/uploads/sites/11/2019/04/male-placeholder-image.jpeg']")
    expect(page).to have_css("img[src*='https://monstar-lab.com/global/wp-content/uploads/sites/11/2019/04/male-placeholder-image.jpeg']")
  end

  it 'should have number of posts ' do
    expect(page).to have_content('Number of posts:2')
  end

  it 'expect on clicking on the user card it redirect to the user show page' do
    click_link 'King'
    expect(current_path).to eq(user_path(@user1))
  end
end
