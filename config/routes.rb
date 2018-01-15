Rails.application.routes.draw do
  
  resources :reports
  resources :tags
  resources :articles
  resources :authors
  root 'authors#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
