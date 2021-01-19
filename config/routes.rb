Rails.application.routes.draw do
  devise_for :customers
  namespace :public do
    root to: 'homes#top'
    get 'homes/about' => 'homes#about'

    resources :customers, only: [:show, :edit, :update]
    get 'customers/confirm' => 'customers#confirm'
    patch 'customers/hide' => 'customers#hide'

    resources :items, only: [:index, :show]
    resources :cart_items, only: [:index, :create, :update, :destroy,]
    delete 'cart_items' => 'cart_items#empty_cart', as: 'public_cart_items_empty'

    resources :orders, only: [:new, :create, :index, :show]
    get 'orders/confirm' => 'orders#confirm'
    get 'orders/complete' => 'orders#complete'

    resources :addresses, only: [:index, :create, :destroy, :edit, :update]

  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
