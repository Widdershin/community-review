require 'rails_helper'

RSpec.describe Review, :type => :model do
  it { should validate_presence_of :name }
  it { should belong_to :user }

  let (:review) { build(:review_with_votes) }

  it 'has a score equal to the number of upvotes - downvotes it has' do
    expect(review.score).to eq review.upvotes - review.downvotes
  end

  it 'has an upvote count' do
    expect(review.upvotes).to eq review.votes_for.up.size
  end

  it 'has an downvote count' do
    expect(review.downvotes).to eq review.votes_for.down.size
  end

  it 'has a hash representation' do
    expected_hash = {
      name: review.name,
      score: review.score,
      id: review.id,
      suggested_by: review.suggested_by,
      submitted: review.submitted,
    }

    expect(review.to_hash).to eq expected_hash
  end

  it 'has the username of the user who suggested it' do
    expect(review.suggested_by).to eq review.user.username
  end

end
