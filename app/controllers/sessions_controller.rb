class SessionsController < ApplicationController
  def create
    user = User.find_or_create_from_auth_hash(auth_hash)
    AuthenticationService.login user
  end

private

  def auth_hash
    request.env['omniauth.auth']
  end
end
