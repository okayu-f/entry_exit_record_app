Rails.application.routes.draw do
  root 'static_pages#home'
  get '/help',          to: 'static_pages#help'
  get '/test',          to: 'static_pages#test'
  post '/entry',        to: 'records#entry'
  post '/exit',         to: 'records#exit'
  get '/records/index', to: 'records#index'
  resources :users
  # resources :records, only: [:create]
end
