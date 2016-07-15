Rails.application.routes.draw do
  # Article
  get '/articles', to: 'articles#index'
  get '/articles/:article_slug', to: 'articles#show'

  # Static Pages
  get '/about', to: 'static_pages#about'

  root to: 'articles#index'
end
