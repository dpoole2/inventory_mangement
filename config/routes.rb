Rails.application.routes.draw do
  resources :reports
  resources :orders
  resources :menu_items
  resources :items
  resources :users
  resources :sessions
  get "log_in" => "sessions#new"
  get "home" => "home#index"
  get "revenue_report" => "reports#revenue_report"
  post "generate_report" => "reports#generate_report"
  root :to => "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
