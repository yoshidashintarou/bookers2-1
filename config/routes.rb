Rails.application.routes.draw do
  devise_for :users

  root to: "homes#top"
  get 'home/about' => 'homes#about'
  resources :books do
  resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end

  resources :users do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "search" => "searches#search"
end
