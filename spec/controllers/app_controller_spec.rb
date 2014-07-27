require 'rails_helper'

RSpec.describe AppController, :type => :controller do
  render_views

  describe "GET 'app'" do
    it "returns http success" do
      get 'app'
      expect(response).to be_success
    end

    it "displays reviews" do
      allow(Review).to receive(:all).and_return([double(:review, name: 'testBlag', score: 0, id: 1)])

      get 'app'
      expect(response.body).to include 'testBlag'
    end
  end

end
