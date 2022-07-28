require 'rails_helper'

RSpec.describe 'Users Page' do
  before do
    driven_by(:rack_test)
  end
  before(:each) do
    @user1 = User.create(name: 'John', bio: 'This is my bio',
                         photo: 'https://eitrawmaterials.eu/wp-content/uploads/2016/09/person-icon.png')
  end

  describe 'Test user index and expect to: ' do
    def create_user
      visit '/users'
      click_link 'New user'
      fill_in 'Name', with: 'Ismail'
      fill_in 'Bio', with: 'This is my bio'
      fill_in 'Photo', with: 'icon.png'
      fill_in 'Posts counter', with: '0'
      click_button 'Create User'
    end

    it 'create a new user' do
      create_user
      expect(page).to have_content('Ismail')
      expect(page).to have_content('Number of posts: 0')
    end

    it 'Shows the username' do
      expect(@user1.name).to have_content('John')
    end

    it 'Shows the user picture' do
      all('img').each do |i|
        expect(i[:src]).to eq('https://eitrawmaterials.eu/wp-content/uploads/2016/09/person-icon.png')
      end
    end

    it 'Shows the number of posts' do
      all(:css, '.num_post').each do |post|
        expect(post).to have_content('Number of posts: 0')
      end
    end

    it 'Redirect to the user show page' do
      create_user
      click_link 'Ismail'
      expect(page).to have_content('Ismail')
      expect(page).to have_content('Number of posts: 0')
      expect(page).to have_content('This is my bio')
      expect(page).to have_content('See all posts')
      expect(page).to have_content('new')
    end
  end
end
