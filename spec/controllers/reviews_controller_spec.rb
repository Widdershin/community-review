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
      expected_json = { reviews: [review_hash] }

      get :show

      expect(response.body).to match_json_expression expected_json
    end
  end

  describe 'POST create' do
    let(:user) { build :user }
    let(:params) { { name: 'test review' } }

    before do
      allow(controller).to receive(:current_user).and_return user
      allow(Review).to receive(:create).and_return(build :review, name: params[:name])
    end

    it 'creates a review' do
      expect(Review).to receive(:create).with(params)

      post :create, params
    end

    context 'params sent as json' do
      it 'responds with json' do
        post :create, params, { "CONTENT_TYPE" => "application/json" }

        expected_json = {
          review: {
            name: params[:name],
            id: Fixnum,
            score: Fixnum
          }
        }

        expect(response.body).to match_json_expression expected_json
      end
    end
  end
end
