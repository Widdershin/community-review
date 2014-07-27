require 'rails_helper'

RSpec.describe VotesController, :type => :controller do
  describe 'POST "create"' do

    let(:test_id) { 1 }
    let(:review) { double :review, id: test_id }

    before do
      allow(Review).to receive(:find_by_id).with(test_id.to_s).and_return review
    end

    context 'when logged in' do

      before do
        @user = mock_login
        allow(@user).to receive(:vote_for_review)
      end

      it 'votes for the given post' do
        expect(@user).to receive(:vote_for_review).with(review)

        post :create, id: test_id
      end

      it 'redirects to the homepage' do
        post :create, id: test_id

        expect(response).to redirect_to '/'
      end
    end

    context 'when logged out' do
      it 'is forbidden' do
        post :create, id: test_id

        expect(response).to_not be_ok
      end
    end
  end

end
