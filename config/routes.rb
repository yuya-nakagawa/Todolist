Rails.application.routes.draw do
  root to: 'toppages#index'
  
  #usersを扱うルーティング
  get 'signup', to: 'users#new'
  resources :users, only: [:create, :edit, :update, :destroy]
end
