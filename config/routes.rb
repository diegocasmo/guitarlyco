Rails.application.routes.draw do
  resources :articles, only: [:index]
  root to: 'articles#index'
end
