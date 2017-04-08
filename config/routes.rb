Rails.application.routes.draw do
  devise_for :users
  resources :chat, only: [:index]
  resources :groups do
    resources :messages
  end
  root "chat#index"
end
