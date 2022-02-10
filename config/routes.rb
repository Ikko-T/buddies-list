Rails.application.routes.draw do
  root to: "buddies#index"
  devise_for :users
  resources :buddies
  resource :users, only: :show
end
