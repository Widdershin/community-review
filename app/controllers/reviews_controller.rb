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
    render json: Review.all
  end

  def update
    if params[:key] != Secret.key
      render(:file => File.join(Rails.root, 'public/403.html'), :status => 403, :layout => false)
    end
  end
end
