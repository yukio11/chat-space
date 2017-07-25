Rails.application.routes.draw do
  devise_for :users
  resources :groups, only: [:index, :new, :create, :edit] do
    resources :messages, only:[:index, :create]
  end
  root "groups#index"
  post 'users/search', to: 'users#search'
end
