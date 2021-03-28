Rails.application.routes.draw do
  resources :tweets
  resources :accounts
  root to: 'accounts#index'
end
