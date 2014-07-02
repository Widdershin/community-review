module LoginHelper
  def mock_login
    user = double :user, username: 'widdershin', id: 1
    allow(controller).to receive(:current_user).and_return user

    user
  end
end