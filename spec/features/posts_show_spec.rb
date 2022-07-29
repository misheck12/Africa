require 'rails_helper'

RSpec.describe 'Testing that user index page', type: :feature do
  before(:each) do
    @user = User.create(name: 'John', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Developer.',
                        posts_counter: 3)

    @post = Post.create(title: 'First Post', text: 'This is my first post', comments_counter: 2, likes_counter: 0,
                        author: @user)

    @comment = Comment.create(text: 'Keep it up!', author: User.first, post: Post.first)

    visit user_post_path(@post.author_id, @post.id)
  end

  it 'Show the post title and author name' do
    expect(page).to have_content "#{@post.title} by: #{@user.name}"
  end

  it 'Show the post title' do
    expect(page).to have_content @post.title
  end

  it 'Show the author name' do
    expect(page).to have_content @user.name
  end

  it 'Show how many comments a post has.' do
    post = Post.first
    expect(page).to have_content post.comments_counter
  end

  it 'Show how many likes a post has.' do
    post = Post.first
    expect(page).to have_content post.likes_counter
  end
end
