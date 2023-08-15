Rails.application.routes.draw do
  devise_for :users
  resources :friends
  #get 'home/index'

  # The {root 'home#index'} is our route to the index home page of our web app, menaing when we enter localhost3000 it iwll direct us to the main index page!
  root 'home#index'

  get 'home/about'
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
