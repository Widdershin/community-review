require 'rails_helper'

feature "Suggesting Reviews", :type => :feature do
  describe 'as a logged in user' do
    let(:user) { build(:user) }

    before do
      login_with_oauth
    end

    context 'when I visit the homepage' do
      it 'I can suggest a review' do
        fill_in 'name', with: 'Cadillac Swingers'
        click_button 'Suggest'

        expect(page).to have_content 'Cadillac Swingers'
      end
    end
  end
end
