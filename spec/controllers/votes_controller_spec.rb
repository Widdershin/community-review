require 'rails_helper'

RSpec.describe VotesController, :type => :controller do
  describe 'POST "create"' do
    let(:review) { double :review, id: 1 }

    before do
      allow(Review).to receive(:find_by_id).and_return(review)
    end

    context 'when logged in' do

      before do
        @user = mock_login
        allow(@user).to receive(:vote_for_review)
      end

      it 'votes for the given post' do
        expect(@user).to receive(:vote_for_review).with(review)

        post :create, post_id: 1
      end

      it 'redirects to the homepage' do
        post :create, post_id: 1

        expect(response).to redirect_to '/'
      end
    end
  end

end
