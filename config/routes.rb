Rails.application.routes.draw do
  get '/auth/reddit/callback', to: 'sessions#create'
  root to: 'app#app'
end
