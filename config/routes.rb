Rails.application.routes.draw do
  devise_for :users

  unauthenticated :user do
    root "pages#home"
  end


  get 'contact', to: 'pages#contact', as: :contact
  get 'about', to: 'pages#about', as: :about


  resources :users, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
