require 'rails_helper'

RSpec.describe Comment, type: :model do
  post = Post.new(title: 'Title', text: 'This is a text')
  subject { Comment.new(post: post, text: 'This is a comment') }

  describe 'Testes the comment class methods' do
    it 'update_comment_counter method raise error when there is no post' do
      expect { subject.comment_counter }.to raise_error(NoMethodError)
    end

    it 'update_comment_counter method return the number of comment\'s' do
      expect(subject.update_comments_counter).to eq(post.update(comments_counter: post.comments.count))
    end
  end
end
