class User < ActiveRecord::Base
  validates :reddit_key, presence: true
end
