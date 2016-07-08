Rails.application.routes.draw do
  devise_for :users
  root to: 'venues#index'
  resources :venues do
    resources :reviews
  end
  resources :reviews
end
