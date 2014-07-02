class ReviewsController < ApplicationController
  def create
    render json: Review.create(name: params[:name])
  end

  def show
    render json: Review.all
  end
end
