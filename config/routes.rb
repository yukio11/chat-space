Rails.application.routes.draw do

  devise_for :users
  resources :groups
  resources :chat, only: [:index]
  root "chat#index"
end
