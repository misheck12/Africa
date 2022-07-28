require 'rails_helper'

RSpec.describe 'Users Page' do
  before do
    driven_by(:rack_test)
  end
  before(:each) do
    visit '/users'
    click_link 'New user'
    fill_in 'Name', with: 'Ismail'
    fill_in 'Bio', with: 'This is my bio'
    fill_in 'Photo', with: 'icon.png'
    fill_in 'Posts counter', with: '0'
    click_button 'Create User'
  end

  describe 'Test user and expect to: ' do
    it 'See the user profile picture' do
      all('img').each do |i|
        expect(i[:src]).to eq('icon.png')
      end
    end

    it 'See the user username' do
      expect(page).to have_content('Ismail')
    end

    it 'See the number of posts the user created' do
      all(:css, '.num_post').each do |post|
        expect(post).to have_content('Number of posts: 0')
      end
    end

    it 'See the user bio' do
      click_link 'Ismail'
      expect(page).to have_content('This is my bio')
    end

    describe 'Test user and expect to: ' do
      before(:each) do
        click_link 'Ismail'
        click_link 'See all posts'
        click_link 'New Post'
        fill_in 'Title', with: 'This is my first post'
        fill_in 'Text', with: 'This is my first post body'
        click_button 'Create Post'
        visit '/users'
        click_link 'Ismail'
      end

      def create_posts
        click_link 'See all posts'
        click_link 'New Post'
        fill_in 'Title', with: 'This is my second post'
        fill_in 'Text', with: 'This is my second post body'
        click_button 'Create Post'
        visit '/users'
        click_link 'Ismail'
        click_link 'See all posts'
        click_link 'New Post'
        fill_in 'Title', with: 'This is my third post'
        fill_in 'Text', with: 'This is my third post body'
        click_button 'Create Post'
      end

      it 'See the users first 3 posts' do
        create_posts
        expect(page).to have_content('This is my first post')
        expect(page).to have_content('This is my second post')
        expect(page).to have_content('This is my third post')
      end

      it 'Redirect to the post show page' do
        click_link 'This is my first post'
        expect(page).to have_content('This is my first post')
      end

      it 'Redirect to see all posts' do
        click_link 'See all posts'
        expect(page).to have_content('This is my first post')
      end
    end
  end
end
