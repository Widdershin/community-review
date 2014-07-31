class Review < ActiveRecord::Base
  validates :name, presence: true
  has_many :review_votes
  has_many :voted_for_by, through: :review_votes, source: :user

  belongs_to :user

  def score
    voted_for_by.length
  end

  def to_hash
    {
      name: name,
      score: score,
      id: id,
      suggested_by: suggested_by,
      submitted: submitted,
    }
  end

  def suggested_by
    user.username
  end

  def self.by_score
    where(submitted: false).sort_by(&:score).reverse
  end

  def self.posted
    where(submitted: true)
  end
end
