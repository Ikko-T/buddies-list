Rails.application.routes.draw do
  root to: "buddies#index"
  devise_for :users, controllers: {
    registrations: "users/registrations",
    passwords: "users/passwords"
  }
  devise_scope :user do
    post "users/guest_sign_in", to: "users/sessions#guest_sign_in"
  end
  resources :buddies
  resource :users, only: :show
end
