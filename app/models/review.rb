class Review < ActiveRecord::Base
  validates :name, presence: true
  has_many :review_votes
  has_many :voted_for_by, through: :review_votes, source: :user
end
