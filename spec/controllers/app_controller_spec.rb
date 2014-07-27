require 'rails_helper'

RSpec.describe AppController, :type => :controller do
  render_views

  describe "GET 'app'" do
    it "returns http success" do
      get 'app'
      expect(response).to be_success
    end

    it "displays reviews" do
      review = build(:review)
      allow(Review).to receive(:all).and_return [build(:review)]

      get 'app'
      expect(response.body).to include review.name
    end
  end

end
