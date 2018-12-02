Rails.application.routes.draw do
  resources :forexes
  root 'pages#home'
  get 'pages/about'
  get 'pages/home'
  get 'pages/contact'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get  'get_rates' => 'forexes#get_rates', :as => 'get_rates'
  get  'calculate_exchange' => 'pages#calculate_exchange', :as => 'calculate_exchange'
end
