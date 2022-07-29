require 'rails_helper'

RSpec.describe 'Testing that user index page', type: :feature do
  before(:each) do
    @user = User.create(name: 'John', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Developer.',
                        posts_counter: 3)

    @post1 = Post.create(title: 'First Post', text: 'This is my first post', comments_counter: 0, likes_counter: 0,
                         author: @user)

    @post2 = Post.create(title: 'Second Post', text: 'This is my second post', comments_counter: 0, likes_counter: 0,
                         author: @user)

    @post3 = Post.create(title: 'Third Post', text: 'This is my third post', comments_counter: 0, likes_counter: 0,
                         author: @user)

    visit user_path(@user.id)
  end

  it 'Show user name details' do
    expect(page).to have_content "#{@user.name}'s Details"
  end

  it "Shows the user's photo" do
    expect(page.first('img')['src']).to have_content 'https://unsplash.com/photos/F_-0BxGuVvo'
  end

  it 'Show user name' do
    expect(page).to have_content 'John'
  end

  it 'Show the number of posts each user has written' do
    expect(page).to have_content @user.posts_counter
  end

  it "show user's bio." do
    expect(page).to have_content 'Developer.'
  end

  it "show user's first 3 posts." do
    expect(page).to have_content 'This is my first post'
    expect(page).to have_content 'This is my second post'
    expect(page).to have_content 'This is my third post'
  end

  it "show button that lets me view all of a user's posts." do
    expect(page).to have_link('See all posts')
  end

  it "click see all posts and redirects to user's post's index page." do
    click_link 'See all posts'
    expect(page).to have_current_path user_posts_path(@user.id)
  end
end
