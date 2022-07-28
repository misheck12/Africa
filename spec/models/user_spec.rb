require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') }
  before { subject.save }
  describe '#last_three_posts' do
    it 'returns last three posts' do
      expect(subject.last_three_posts).to eq(subject.posts.reverse)
    end
  end

  describe 'Test validations' do
    it 'returns false if the user name is not present' do
      subject.name = ''
      subject.posts_counter = 1
      expect(subject.valid?).to be false
    end

    it 'returns false if the user name is not present or "nil"' do
      subject.name = nil
      subject.posts_counter = 1
      expect(subject.valid?).to be false
    end

    it 'returns true if the user name is present' do
      subject.name = 'Ismail'
      subject.posts_counter = 1
      expect(subject.valid?).to be true
    end

    it 'returns true if the post conter greater than or equel 0' do
      subject.name = 'Ismail'
      subject.posts_counter = 0
      expect(subject.valid?).to be true
      subject.posts_counter = 4
      expect(subject.valid?).to be true
    end

    it 'returns false if the post conter less than 0' do
      subject.name = 'Ismail'
      subject.posts_counter = -1
      expect(subject.valid?).to be false
    end

    it 'returns false if the post conter is not an integer' do
      subject.name = 'Ismail'
      subject.posts_counter = 'rr'
      expect(subject.valid?).to be false
    end
  end
end
