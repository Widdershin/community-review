require 'rails_helper'

RSpec.describe AppController, :type => :controller do

  describe "GET 'app'" do
    it "returns http success" do
      get 'app'
      expect(response).to be_success
    end
  end

end
