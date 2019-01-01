Rails.application.routes.draw do
  resources :orders
  resources :themes
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  get 'home/index'
  get 'persons/profile', as: 'user_root'
  root to: 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
