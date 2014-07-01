require 'rails_helper'

RSpec.describe Review, :type => :model do
  it { should validate_presence_of :name }
  it { should have_many :review_votes }
  it { should have_many :voted_for_by }

  let (:review) { build(:review_with_votes) }

  it 'has a score equal to the number of votes it has' do
    expect(review.score).to eq review.voted_for_by.size
  end
end
