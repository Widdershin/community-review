class User < ActiveRecord::Base
  validates :reddit_key, presence: true

  has_many :review_votes
  has_many :reviews_voted_for, through: :review_votes, source: :review
end
