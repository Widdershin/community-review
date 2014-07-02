class VotesController < ApplicationController
  before_filter :confirm_logged_in

  def create
    review = Review.find_by_id(params[:id]) || not_found

    current_user.vote_for_review review
    p current_user.reviews_voted_for
    redirect_to '/'
  end
end
