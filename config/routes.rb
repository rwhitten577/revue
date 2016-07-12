Rails.application.routes.draw do
  root to: 'venues#index'
  resources :venues do
    resources :reviews do
      post 'upvote', to: 'votes#create_upvote'
      post 'downvote', to: 'votes#create_downvote'
    end
  end
  resources :reviews

  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
end
