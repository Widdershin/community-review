require 'rails_helper'

RSpec.describe ReviewsController, :type => :controller do
  describe 'GET show' do
    it 'returns a JSON list of reviews' do
      review_hash = {
          name: 'test',
          score: 5,
          id: 1
      }
      review = double(:review, to_hash: review_hash)
      allow(Review).to receive(:all).and_return [review]
      expected_json = [review_hash]

      get :show

      expect(response.body).to match_json_expression expected_json
    end
  end
end
