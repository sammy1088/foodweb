Foodweb::Application.routes.draw do
  root "pages#home"
  get "home", to: "pages#home", as: "home"
  get "inside", to: "pages#inside", as: "inside"
  resources :charges
  
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" } 
  resources :users
  resources :user do
    resources :posts
end
  resources :posts
  get '/auth/:provider/callback', to: 'sessions#create'

  get "disclaimer", to: "pages#disclaimer", as: "disclaimer"


  namespace :admin do
    root "base#index"
    resources :users
    
  end

end
