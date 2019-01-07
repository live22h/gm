Rails.application.routes.draw do
  # resources :specialists
  # resources :messages
  resources :orders
  resources :themes
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  post "messages" => "orders#message"
  post "specialists" => "persons#specialist"
  get 'specialists/accepted/:id', to: 'specialists#accepted', as: "accepted_specialist"
  get 'specialists/done/:id', to: 'specialists#done', as: "done_specialist"

  get 'home/index'
  get 'persons/profile', as: 'user_root'
  root to: 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
