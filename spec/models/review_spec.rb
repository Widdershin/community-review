require 'rails_helper'

RSpec.describe Review, :type => :model do
  it { should validate_presence_of :name }
  it { should have_many :review_votes }
  it { should have_many :voted_for_by }
end
