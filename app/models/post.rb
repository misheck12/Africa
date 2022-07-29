class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :likes, dependent: :destroy, foreign_key: :post_id
  has_many :comments, dependent: :destroy, foreign_key: :post_id

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, comparison: { greater_than_or_equal_to: 0 }
  validates :likes_counter, comparison: { greater_than_or_equal_to: 0 }

  after_save :update_posts_counter
  after_destroy :update_posts_counter

  def update_posts_counter
    author.update(posts_counter: author.posts.count)
  end

  def last_five_comments
    comments.last(5)
  end
end
