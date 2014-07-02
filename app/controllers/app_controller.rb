class AppController < ApplicationController
  def app
    @reviews = Review.all
  end
end
