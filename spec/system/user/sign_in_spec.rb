require 'rails_helper'

RSpec.describe 'Login User', type: :system do
  scenario 'Log in existing user' do
    visit new_user_session_path
    # fill in text fields with specified string
    fill_in 'Email', with: 'ritta.sweta@yahoo.com'
    fill_in 'Password', with: '123123123'
    click_button 'Log in'
    
    # When I click the submit button after filling in the username and the password with correct data, I am redirected to the root page.
    expect(page).to have_current_path(users_path)

    # 1 new bookmark record is created
    expect(User.count).to eq(1)
  end 

  scenario 'empty title and url' do
    visit new_user_session_path
    click_button 'Log in'

    # The page should show error message 'Title can't be blank'
    expect(page).to have_content("Title can't be blank")

    # No bookmark record is created
    expect(Bookmark.count).to eq(0)
  end
end