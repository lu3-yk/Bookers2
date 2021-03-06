Rails.application.routes.draw do
  get 'chats/show'
  get 'relationships/followings'
  get 'relationships/followers'
  devise_for :users

  root :to =>"homes#top"
  get 'home/about'=>'homes#about', as:'about'
  
  get 'chat/:id', to: 'chats#show', as: 'chat'
  resources :chats, only: [:create]

  resources :books, only: [:index,:show,:edit,:create,:destroy,:update] do
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  resources :users, only: [:index,:show,:edit,:update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
    get "search",to: "users#search"
  end  

end 
