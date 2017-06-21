Rails.application.routes.draw do

  resources :posts do
    resources :comments, module: :posts
  end
  
  devise_for :users, :controllers => {:registrations => "users/registrations"}

  resources :users, :only => [:show] do
  	post 'follow' => 'followings#create'
  	delete 'follow' => 'followings#destroy'
  end
  get 'pages/index'

  get 'pages/abot'

  root 'pages#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
