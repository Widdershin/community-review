require 'rails_helper'

feature "Upvoting Reviews", :type => :feature do
  context 'as a logged in user' do
    let (:user) { build :user }

    before do
      login_with_oauth
    end

    it 'I can upvote reviews', js: true do
      review = build :review

      allow(Review).to receive(:all).and_return([review])

      visit '/'

      expect(page).to have_content '0 point(s)'
      find('.upvote').click

      expect(page).to have_content '1 point(s)'
    end

  end
end
