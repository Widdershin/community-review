class AppController < ApplicationController
  def app
    @suggested_reviews = Review.by_score
    @posted_reviews = Review.posted
  end
end
