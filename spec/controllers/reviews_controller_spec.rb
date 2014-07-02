require 'rails_helper'
require 'json'

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
    context 'when logged in' do
      let(:user) { build :user }
      let(:params) { { name: 'test review' } }

      before do
        allow(controller).to receive(:current_user).and_return user
        allow(Review).to receive(:create).and_return(build :review, name: params[:name])
      end

      it 'creates a review' do
        expect(Review).to receive(:create).with(name: params[:name])

        post :create, params
      end

      context 'params sent as json' do
        it 'responds with json' do
          post :create, format: :json, **params

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

      context 'params sent form encoded' do
        it 'redirects to the homepage' do
          post :create, params

          expect(response).to redirect_to '/'
        end
      end
    end

    context 'logged out' do
      it 'is forbidden' do
        post :create, name: 'sad face'
        expect(response).to be_forbidden
      end
    end
  end
end
