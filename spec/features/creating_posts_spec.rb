require 'rails_helper.rb'

feature 'Creating posts' do
  scenario 'can create a post' do
    visit '/'
    click_link 'New Post'
    attach_file('Image', "spec/files/images/bday.jpg")
    fill_in 'Caption', with: 'happy happy birthday #tokyo' 
    click_button 'Create Post'
    expect(page).to have_content('#tokyo')
    expect(page).to have_css("img[src*='bday.jpg']")
  end

  it 'needs an image to create a post' do
  visit '/'
  click_link 'New Post'
  fill_in 'Caption', with: "No picture found"
  click_button 'Create Post'
  expect(page).to have_content('You need an image to post')
  end
end