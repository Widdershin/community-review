require 'rails_helper'

RSpec.describe "app/app.html.erb", :type => :view do
  it 'renders reviews' do
    review = build(:review)
    assign(:reviews, [review])

    render

    expect(rendered).to include review.name
  end
end
