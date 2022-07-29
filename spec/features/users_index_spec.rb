require 'rails_helper'

RSpec.describe 'Testing that user index page', type: :feature do
  before(:each) do
    @user = User.create(name: 'John', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Developer.',
                        posts_counter: 5)
    visit users_path
  end

  it 'Shows users names.' do
    expect(page).to have_content(@user.name)
  end

  it "Shows the user's photo" do
    expect(page.first('img')['src']).to have_content 'https://unsplash.com/photos/F_-0BxGuVvo'
  end

  it 'Shows the number of posts each user has written' do
    expect(page).to have_content('Number of posts: 5')
  end

  it 'Shows the number of posts each user has written' do
    click_link @user.name
    expect(current_path).to eq user_path(@user.id)
  end
end
