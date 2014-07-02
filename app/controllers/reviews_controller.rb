class ReviewsController < ApplicationController
  def create
  end

  def show
    render json: Review.all
  end
end
