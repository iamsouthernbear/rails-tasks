Rails.application.routes.draw do

  devise_for :users
  resources :reports
  resources :tags
  resources :articles
  resources :authors
  resources :comments
  root to: 'authors#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
