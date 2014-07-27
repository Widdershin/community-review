require 'rails_helper'

describe SessionsController, :type => :controller do

  describe "GET 'create'" do
    let (:user) { double :user, id: 1 }

    before do
      allow(User).to receive(:find_or_create_from_auth_hash).and_return user
    end

    it 'creates or finds the user' do
      expect(User).to receive(:find_or_create_from_auth_hash)
      get 'create'
    end

    it 'logs that user in' do
      get 'create'
      expect(session[:user_id]).to eq user.id
    end

    it 'redirects to the homepage' do
      get 'create'
      expect(response).to redirect_to '/'
    end
  end

end
