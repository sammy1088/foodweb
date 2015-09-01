Foodweb::Application.routes.draw do
  root "pages#home"
  get "home", to: "pages#home", as: "home"
  get "inside", to: "pages#inside", as: "inside"
  resources :charges
resources :users
  resources :posts
  
  get '/auth/:provider/callback', to: 'sessions#create'

  get "disclaimer", to: "pages#disclaimer", as: "disclaimer"

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" } 

  namespace :admin do
    root "base#index"
    resources :users
    
  end

end
