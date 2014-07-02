class ReviewsController < ApplicationController
  def create
    review = Review.create(name: params[:name])

    respond_to do |format|
      format.html { redirect_to '/' }
      format.json { render json: review }
    end
  end

  def show
    render json: Review.all
  end
end
