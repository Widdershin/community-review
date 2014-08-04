class User < ActiveRecord::Base
  validates :username, presence: true

  acts_as_voter

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
    up_votes review
    save!
  end
end
