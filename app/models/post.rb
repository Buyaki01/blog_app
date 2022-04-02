class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments, foreign_key: 'post_id'
  has_many :likes, foreign_key: 'post_id'
  after_save :update_posts_counter

  validates :title, presence: true, length: { in: 1..250 }
  validates :comments_counter, numericality: { greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { greater_than_or_equal_to: 0 }

  def fetch_five_recent_comments
    comments.order('created_at DESC').limit(5)
  end

  private

  def update_posts_counter
    author.increment!(:posts_counter)
  end
end
