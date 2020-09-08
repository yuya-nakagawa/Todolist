Rails.application.routes.draw do
  root to: 'toppages#index'
  
  #ログイン
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  #user
  get 'signup', to: 'users#new'
  resources :users, only: [:create, :edit, :update, :destroy]
  
  #task
  resources :tasks, only: [:create, :edit, :update, :destroy]do
    member do
      post :done
      post :wip
    end
  end
end
