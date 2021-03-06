Rails.application.routes.draw do
  root to: 'venues#index'
  resources :venues do
    resources :reviews, only: [:new, :create, :edit, :update, :destroy]
  end

  resources :reviews, only: [:new, :create, :edit, :update, :destroy] do
    resources :votes, only: [:create]
  end

  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  namespace :admin do
    resources :users
  end

  namespace :api do
    namespace :v1 do
      resources :venues, only: [:index]
    end
  end
end
