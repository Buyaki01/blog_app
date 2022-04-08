require 'rails_helper'

RSpec.describe 'index page', type: :system do
  before :all do
    image = 'https://images.unsplash.com/photo-1648974299612-679d6fb46816?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'
    user1 = User.create!( name: 'Tom', photo: image, bio:'Programer', posts_counter: 0, email: 'tom@example.com', password: 'tom123') 
  end
  scenario 'Display username, profile picture, number of posts for each user' do
    visit users_path
    expect(page).to have_content(user1.name)
    expect(page).to have_content(user1.photo)
    expect(page).to have_content("Number of posts")

    #When I click on a user, I am redirected to that user's show page
    click_button 'Log in'
    expect(page).to have_current_path(user_path)
  end
end