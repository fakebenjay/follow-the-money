Rails.application.routes.draw do
  resources :cycles
  resources :industries
  resources :donors
  resources :parties
  resources :states
  resources :officials
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
