Rails.application.routes.draw do
  resources :themes do
    member do
      post :toggle
    end
  end
  resources :tweets
  resources :accounts do
    member do
      post :sync
    end
  end
  root to: 'application#index'
end
