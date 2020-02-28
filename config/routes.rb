Rails.application.routes.draw do
  devise_for :users
  root to: 'arts#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/about', to: 'pages#about'
  get '/contact', to: 'pages#contact'
  get '/myprofile', to: 'pages#myprofile'
  patch '/myprofile', to: 'pages#update_my_profile'
  resources :messages, only: [:index, :new, :create]

  namespace :owner do
    resources :arts
  end

  resources :arts, only: [:index, :show] do
    resources :rentals, only: [:new, :create]
    resources :reviews, except: [:destroy, :show]
  end

  resources :rentals, only: [:index]

end
