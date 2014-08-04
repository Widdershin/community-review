class Review < ActiveRecord::Base
  acts_as_votable

  validates :name, presence: true
  belongs_to :user

  def score
    upvotes - downvotes
  end

  def upvotes
    votes_for.up.size
  end

  def downvotes
    votes_for.down.size
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
