Rails.application.routes.draw do
  resource :reviews, only: [:create, :show]
  resource :votes, only: [:create]

  get '/auth/reddit/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#logout'
  root to: 'app#app'
end
