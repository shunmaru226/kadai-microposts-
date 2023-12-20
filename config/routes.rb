Rails.application.routes.draw do
    root to: 'toppages#index'
    
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'   
  get '/users/:id/likes', to: 'users#fav_posts', as: 'likes'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :create] do
  member do
    get :followings
    get :followers
    get :fav_posts
   end
    collection do
      get :serach
    end
  end

  resources :microposts, only: [ :create, :destroy]
  resources :relationships, only: [:create, :destroy]
  resources :favorites, only: [:create, :destroy]
end