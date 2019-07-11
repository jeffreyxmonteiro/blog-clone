Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
     root to: 'users#current_user_home'
  end

  unauthenticated :user do
    root "pages#home"
  end


  get 'contact', to: 'pages#contact', as: :contact
  get 'about', to: 'pages#about', as: :about

  resources :users, only: [:show] do
    resources :snipps, only: [:new, :create]
  end
  resources :tags, only: [:show]

  resources :snipps, only: [:show, :edit, :update, :destroy]

end
