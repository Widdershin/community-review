class User < ActiveRecord::Base
  validates :username, presence: true

  has_many :review_votes
  has_many :reviews_voted_for, through: :review_votes, source: :review

  has_many :reviews

  def self.find_or_create_from_auth_hash auth_hash
    username = auth_hash[:info][:name]

    existing_user = find_by_username username

    existing_user or create username: username
  end

  def to_s
    username
  end

  def vote_for_review review
    reviews_voted_for << review

    save!
  end

  def upvoted? review
    reviews_voted_for.exists? review.id
  end
end
