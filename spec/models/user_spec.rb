require 'rails_helper'

describe User, :type => :model do
  it { should validate_presence_of :reddit_key }
  it { should have_many :review_votes }
  it { should have_many :reviews_voted_for}
end
