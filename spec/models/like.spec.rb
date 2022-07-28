require 'rails_helper'

RSpec.describe Like, type: :model do
  post = Post.new(title: 'Title', text: 'This is a text')
  subject { Like.new(post: post) }

  describe 'Testes the like class methods' do
    it 'update_likes_counter method raise error when there is no post' do
      expect { subject.comment_counter }.to raise_error(NoMethodError)
    end

    it 'update_likes_counter method return the number of like\'s' do
      expect(subject.update_comments_counter).to eq(post.update(comments_counter: post.comments.count))
    end
  end
end
