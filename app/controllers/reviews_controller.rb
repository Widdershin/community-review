class ReviewsController < ApplicationController
  before_filter :confirm_logged_in, only: [:create]

  def create
    review = current_user.reviews.create(name: params[:name])

    respond_to do |format|
      format.html { redirect_to '/' }
      format.json { render json: review }
    end
  end

  def show
    render json: Review.by_score
  end
end
