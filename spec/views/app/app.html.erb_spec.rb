require 'rails_helper'

RSpec.describe "app/app.html.erb", :type => :view do
  let (:review) { build(:review) }

  before do
    assign(:reviews, [review])
    render
  end

  it 'renders reviews' do
    expect(rendered).to include review.name
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
