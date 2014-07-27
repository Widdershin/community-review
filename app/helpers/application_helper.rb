module ApplicationHelper
  def current_user
    User.find_by_id session[:user_id]
  end

  def upvoted? review
    if current_user.nil?
      return false
    end

    current_user.upvoted? review
  end
end
