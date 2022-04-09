require 'rails_helper'
​
RSpec.describe 'Posts index page', type: :feature do
  before :each do
    @user1 = User.create!(
      name: 'King',
      photo: 'https://monstar-lab.com/global/wp-content/uploads/sites/11/2019/04/male-placeholder-image.jpeg',
      bio: 'Dancer',
      posts_counter: 0,
      email: 'king@example.com',
      password: 'king123'
    )
​
    @user2 = User.create!(email: 'janedoe@gmail.com', password: '123abc', name: 'Jane', bio: 'Lorem Ipsum...', photo: 'https://monstar-lab.com/global/wp-content/uploads/sites/11/2019/04/male-placeholder-image.jpeg')
​
    visit '/users/sign_in'
    fill_in 'Email', with: 'king@example.com'
    fill_in 'Password', with: 'king123'
    click_button 'Log in'
​
    @post1 = @user1.posts.create!(title: 'Dancing', text: 'Dancing is my hobby', comments_counter: 0, likes_counter: 0)
    @post2 = @user1.posts.create!(title: 'Zumba', text: 'Dancing Zumba helps me keep fit', comments_counter: 0,
                                  likes_counter: 0)
    @post3 = @user1.posts.create!(title: 'Salsa', text: 'Salsa dancing is perfect for couples', comments_counter: 0,
                                  likes_counter: 0)
    @post4 = @user1.posts.create!(title: 'Kizomba', text: 'Kizomba is just awesome!', comments_counter: 0,
                                  likes_counter: 0)
​
    @post1.comments.create!(author: @user2, text: 'Woow!')
    @post1.comments.create!(author: @user1, text: 'Same to me')
    @post1.comments.create!(author: @user2, text: 'so true')
    @post1.comments.create!(author: @user1, text: 'Amazing!')
    @post1.comments.create!(author: @user2, text: 'Awesome!')
    @post1.comments.create!(author: @user1, text: 'Perfect!')
​
    @post1.likes.create!(author: @user1)
    @post1.likes.create!(author: @user2)
​
    visit user_posts_path(@user1)
  end
​
  it "should have the user's profile picture" do
    expect(page).to have_css("img[src*='https://monstar-lab.com/global/wp-content/uploads/sites/11/2019/04/male-placeholder-image.jpeg']")
  end
​
  it "should be able to see user's name" do
    expect(page).to have_content('King')
  end
​
  it 'should display the number of posts' do
    expect(page).to have_content('Number of posts:4')
  end
​
  it "should display the posts' titles" do
    expect(page).to have_content('Dancing')
    expect(page).to have_content('Zumba')
    expect(page).to have_content('Salsa')
    expect(page).to have_content('Kizomba')
  end
​
  it "should display some of the posts' body" do
    expect(page).to have_content('Dancing is my hobby')
    expect(page).to have_content('Dancing Zumba helps me keep fit')
    expect(page).to have_content('Salsa dancing is perfect for couples')
    expect(page).to have_content('Kizomba is just awesome!')
  end
​
  describe 'Comments and Like' do
    it 'should display the first comments of a post' do
      expect(page).to have_content('Woow!')
      expect(page).to have_content('so true')
    end
​
    it 'should display the how many comments a post has' do
      expect(page).to have_content('Comments: 6')
    end
​
    it 'should display the number of likes a post has' do
      expect(page).to have_content('Likes: 2')
    end
  end
​
  it 'should show a section for pagination' do
    expect(page).to have_button('pagination')
  end
​
  it 'should redirect me to a post show page when I click on it' do
    click_link('Dancing')
    expect(current_path).to eq(user_post_path(@user1, @post1))
  end
end