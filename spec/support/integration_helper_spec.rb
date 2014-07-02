module IntegrationSpecHelper
  def login_with_oauth(service = :reddit)
    visit "/auth/#{service}"
  end
end