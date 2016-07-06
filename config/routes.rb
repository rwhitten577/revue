Rails.application.routes.draw do
<<<<<<< HEAD
  devise_for :users
  root to: 'venues#index'
=======
  resources :venues
>>>>>>> 06e7f9222e5d743f412c6ae96523409b6124c559
end
