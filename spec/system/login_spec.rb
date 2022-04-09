require 'rails_helper'

RSpec.describe 'Login User', type: :system do
  describe 'Log in existing user' do
    before :each do
      @user = User.create!(
        name: 'King',
        photo: 'https://monstar-lab.com/global/wp-content/uploads/sites/11/2019/04/male-placeholder-image.jpeg',
        bio: 'Dancer',
        posts_counter: 0,
        email: 'king@example.com',
        password: 'king123'
      )
      visit '/users/sign_in'
    end

    it 'shows the right content and placeholders' do
      expect(page).to have_field('Email')
      expect(page).to have_field('Password')
      expect(page).to have_button('Log in')
      expect(page).to have_link('Sign up')
      expect(page).to have_link('Forgot your password?')
    end
  end

  it 'when user clicks the login button after entering correct data' do
    fill_in 'Email', with: 'king@example.com'
    fill_in 'Password', with: 'king123'
    click_button 'Log in'
    expect(page).to have_current_path(root_path)
  end

  It 'empty email and password' do
    fill_in 'Email', with: ''
    fill_in 'Password', with: ''
    click_button 'Log in'
    expect(page).to have_content('')
  end

  It 'incorrect email and password' do
    visit user_session_path
    fill_in 'Email', with: 'king@example.com'
    fill_in 'Password', with: '123'
    click_button 'Log in'
    expect(page).to have_content('')
  end
end
