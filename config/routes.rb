Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resource :search, only: :show
  resources :stats, only: :index

  root to: 'searches#show'
end
