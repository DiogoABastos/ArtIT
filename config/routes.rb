Rails.application.routes.draw do
  devise_for :users
  root to: 'arts#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :owner do
    resources :arts, only: [:index, :destroy, :edit, :update, :show, :new, :create]
  end

  resources :arts, only: [:index, :show]

end
