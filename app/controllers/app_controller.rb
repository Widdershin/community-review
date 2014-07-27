class AppController < ApplicationController
  def app
    @reviews = Review.by_score
  end
end
