require 'rails_helper'

describe User, :type => :model do
  it { should validate_presence_of :username }
  it { should have_many :reviews }

  let (:user) { create :user }
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

  it 'gives username as a string representation' do
    expect(user.to_s).to eq user.username
  end

  it 'votes for reviews' do
    review = create :review
    user.upvotes review
    expect(user.find_up_voted_items).to include review
  end
end
