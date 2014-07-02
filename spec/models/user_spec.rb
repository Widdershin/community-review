require 'rails_helper'

describe User, :type => :model do
  it { should validate_presence_of :username }
  it { should have_many :review_votes }
  it { should have_many :reviews_voted_for}

  let (:user) { build :user }
  let (:auth_hash) do
    {
      info: {
        name: 'Widdershiny'
      }
    }
  end

  it 'is created from an auth hash' do
    allow(User).to receive(:create).with(username: 'Widdershiny').and_return user
    expect(User.find_or_create_from_auth_hash auth_hash).to eq user
  end

  it 'finds existing users from auth hash' do
    allow(User).to receive(:find_by_username).with('Widdershiny').and_return user
    expect(User.find_or_create_from_auth_hash auth_hash).to eq user
  end
end
