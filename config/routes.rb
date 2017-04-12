Rails.application.routes.draw do
  devise_for :users
  resources :groups, except: [:show, :update, :destroy] do
    resources :messages, only:[:index, :create]
  end
  root "groups#index"
end
