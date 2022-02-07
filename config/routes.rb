Rails.application.routes.draw do
  root 'static_pages#home'
  get 'static_pages/help'
  post '/entry',   to: 'records#entry'
  post '/exit',   to: 'records#exit'
  resources :users
  # resources :records, only: [:create]
end
