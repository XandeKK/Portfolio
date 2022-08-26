Rails.application.routes.draw do
  resources :projects
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  root 'home#index'
end
