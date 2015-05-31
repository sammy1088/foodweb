Foodweb::Application.routes.draw do
  root "posts#index"
  get "home", to: "pages#home", as: "home"
  get "inside", to: "pages#inside", as: "inside"
  
   resources :posts
  devise_for :users

  namespace :admin do
    root "base#index"
    resources :users
    
  end

end
