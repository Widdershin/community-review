class User < ActiveRecord::Base
  validates :username, presence: true

  has_many :review_votes
  has_many :reviews_voted_for, through: :review_votes, source: :review

  def self.find_or_create_from_auth_hash auth_hash
    username = auth_hash[:info][:name]
    create username: username
  end
end
