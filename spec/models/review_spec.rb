require 'rails_helper'

RSpec.describe Review, :type => :model do
  it { should validate_presence_of :name }
  it { should have_many :review_votes }
  it { should have_many :voted_for_by }
  it { should belong_to :user }

  let (:review) { build(:review_with_votes) }

  it 'has a score equal to the number of votes it has' do
    expect(review.score).to eq review.voted_for_by.size
  end

  it 'has a hash representation' do
    expected_hash = {
      name: review.name,
      score: review.score,
      id: review.id
    }

    expect(review.to_hash).to eq expected_hash
  end

end
