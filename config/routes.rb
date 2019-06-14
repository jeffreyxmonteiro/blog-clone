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

  resources :snipps, only: [:destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
