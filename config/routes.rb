Rails.application.routes.draw do
  root to: 'venues#index'
  resources :venues do
    resources :reviews
  end
  resources :reviews

  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
end
