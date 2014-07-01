require 'rails_helper'

describe SessionsController, :type => :controller do

  describe "GET 'create'" do
    before do
      allow(User).to receive(:find_or_create_from_auth_hash)
    end


    it "returns http success" do
      get 'create'
      expect(response).to be_success
    end

    it 'creates or finds the user' do
      expect(User).to receive(:find_or_create_from_auth_hash)
      get 'create'
    end
  end

end
