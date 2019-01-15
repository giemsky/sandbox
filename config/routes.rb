Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount RailsEventStore::Browser => '/res' if Rails.env.development?

  resources :orders, only: [:new, :index, :show, :create]
  resources :jobs, only: [:index, :show]

  root to: 'orders#index'
end
