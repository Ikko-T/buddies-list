Rails.application.routes.draw do
  devise_for :users
  resources :buddies
  root "homes#index"
end
