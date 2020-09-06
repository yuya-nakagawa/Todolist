Rails.application.routes.draw do
  root to: 'toppages#index'
  
  #ログイン
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  #usersを扱うルーティング
  get 'signup', to: 'users#new'
  resources :users, only: [:create, :edit, :update, :destroy]
end
