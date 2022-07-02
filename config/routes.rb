Rails.application.routes.draw do
  
 
  root to: "homes#top"
  devise_for :users
  get 'home/about', to: 'homes#about', as: 'about'
  
  resources :books do
    resource :favorites, only: [:create, :destroy]
  end  
  resources :users, only: [:show, :edit, :index, :update,]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
