Rails.application.routes.draw do
  get 'users/show'

  resources :posts
  devise_for :users, :controllers => {:registrations => "users/registrations"}
  resources :users, only: [:show]
  get 'pages/index'

  get 'pages/abot'

  root 'pages#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
