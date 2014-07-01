require 'rails_helper'

describe SessionsController, :type => :controller do

  describe "GET 'create'" do
    let (:user) { double :user }

    before do
      allow(User).to receive(:find_or_create_from_auth_hash).and_return user
      allow(AuthenticationService).to receive(:login)
    end


    it "returns http success" do
      get 'create'
      expect(response).to be_success
    end

    it 'creates or finds the user' do
      expect(User).to receive(:find_or_create_from_auth_hash)
      get 'create'
    end

    it 'logs that user in' do
      expect(AuthenticationService).to receive(:login).with user
      get 'create'
    end
  end

end
