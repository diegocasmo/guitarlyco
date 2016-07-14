Rails.application.routes.draw do
  get '/articles', to: 'articles#index'
  get '/articles/:article_slug', to: 'articles#show'

  root to: 'articles#index'
end
