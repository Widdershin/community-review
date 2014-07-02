class SessionsController < ApplicationController
  def create
    user = User.find_or_create_from_auth_hash(auth_hash)
    login user
  end

  def login user
    session[:user_id] = user.id
  end

  def logout
    session[:user_id] = nil
    redirect_to '/'
  end

private

  def auth_hash
    request.env['omniauth.auth']
  end
end
