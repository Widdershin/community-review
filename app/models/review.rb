class Review < ActiveRecord::Base
  validates :name, presence: true
  has_many :review_votes
end
