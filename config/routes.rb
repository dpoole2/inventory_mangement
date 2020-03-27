Rails.application.routes.draw do
  resources :orders
  resources :menu_items
  resources :items
  resources :users
  resources :sessions
  get "log_in" => "sessions#new"
  get "home" => "home#index"
  root :to => "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
