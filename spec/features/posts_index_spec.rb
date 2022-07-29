require 'rails_helper'

RSpec.describe 'Testing that user index page', type: :feature do
  before(:each) do
    @user = User.create(name: 'John', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Developer.',
                        posts_counter: 3)

    @post = Post.create(title: 'First Post', text: 'This is my first post', comments_counter: 2, likes_counter: 0,
                        author: @user)

    @comment = Comment.create(text: 'Keep it up!', author: User.first, post: Post.first)

    visit user_posts_path(@user.id)
  end

  it 'Show user name posts' do
    expect(page).to have_content "All #{@user.name}'s Posts"
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

  it 'Show some of the post detail' do
    expect(page).to have_content 'This is my first post'
  end

  it 'Show the first comment on a post' do
    expect(page).to have_content 'Keep it up!'
  end

  it 'Show how many comments a post has.' do
    post = Post.first
    expect(page).to have_content post.comments_counter
  end

  it 'Show how many likes a post has.' do
    post = Post.first
    expect(page).to have_content post.likes_counter
  end

  it "redirects the user to the post's show page after clickin on it" do
    click_link 'First Post'
    expect(page).to have_current_path user_post_path(@post.author_id, @post.id)
  end

  it 'Show some of the post detail' do
    expect(page).to have_content 'This is my first post'
  end

  it 'can see the username of each commentor.' do
    post = Post.first
    comment = post.comments.first
    expect(page).to have_content(comment.author.name)
  end

  it 'can see the comments of each commentor.' do
    expect(page).to have_content 'Keep it up!'
  end
end
