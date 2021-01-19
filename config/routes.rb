Rails.application.routes.draw do

  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }
  devise_for :customers
  namespace :public do
    root to: 'homes#top'
    get 'homes/about'
  end

  namespace :admin do
    resources :items
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:index, :show, :update]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
