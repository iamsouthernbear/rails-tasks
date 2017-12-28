Rails.application.routes.draw do
  resources :requests
  root 'requests#index'
end
