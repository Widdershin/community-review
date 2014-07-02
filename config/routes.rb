Rails.application.routes.draw do
  get '/auth/reddit/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#logout'
  root to: 'app#app'
end
