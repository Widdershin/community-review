class Review < ActiveRecord::Base
  validates :name, presence: true
  has_many :review_votes
  has_many :voted_for_by, through: :review_votes, source: :user

  def score
    voted_for_by.length
  end

  def to_hash
    {
      name: name,
      score: score,
      id: id
    }
  end
end
