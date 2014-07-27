require 'rails_helper'

RSpec.describe "app/app.html.erb", :type => :view do
  let (:review) { create(:review) }

  before do
    assign(:reviews, [review])
    render
  end

  describe 'reviews' do
    it 'displays the name' do
      expect(rendered).to include review.name
    end

    it 'displays the score' do
      expect(rendered).to include review.score.to_s
    end

    it 'displays the owner' do
      expect(rendered).to include review.user.username
    end
  end

  context 'when logged in' do
    before do
      allow(view).to receive(:current_user).and_return build(:user)
      render
    end

    it 'shows the suggest a review form' do
      expect(response).to have_selector('form[action="/reviews"]')
    end

    it 'shows the upvote arrows' do
      expect(response).to have_selector('.icon-up-open')
    end
  end

  context 'when logged out' do
    it 'does not show the suggest a review form' do
      expect(response).to_not have_selector('form[action="/reviews"]')
    end

    it 'does not show the upvote arrows' do
      expect(response).to_not have_selector('.icon-up-open')
    end
  end
end
