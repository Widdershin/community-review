require 'rails_helper'

RSpec.describe "app/app.html.erb", :type => :view do
  let (:review) { build(:review) }

  before do
    assign(:reviews, [review])
  end

  it 'renders reviews' do
    render

    expect(rendered).to include review.name
  end

  context 'when logged in' do
    before do
      allow(view).to receive(:current_user).and_return build(:user)
    end

    it 'shows the suggest a review form' do
      render
      expect(response).to have_selector('form[action="/reviews"]')
    end
  end
end
