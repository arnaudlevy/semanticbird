Rails.application.routes.draw do
  resources :themes do
    member do
      post :toggle
    end
  end
  resources :tweets
  resources :accounts
  root to: 'accounts#index'
end
