Rails.application.routes.draw do
  root to: 'homes#top'
  get 'homes/about' => 'homes#about'

  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }
  devise_for :customers
  namespace :public do
    resources :customers, only: [:show, :edit, :update] do
      member do
        get "confirm"
        #ユーザーの会員状況を取得
        patch "hide"
        #ユーザーの会員状況を更新
      end
    end

    resources :items
    resources :cart_items, only: [:index, :create, :update, :destroy]
    delete 'cart_items' => 'cart_items#empty_cart', as: 'cart_items_empty'

    resources :orders, only: [:new, :create, :index, :show]
    get 'orders/confirm' => 'orders#confirm'
    get 'orders/complete' => 'orders#complete'

    resources :addresses, only: [:index, :create, :destroy, :edit, :update]

  end

  namespace :admin do
    root to: 'homes#top'
    resources :items
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:index, :show, :update] do
      resources :order_items, only: [:update]
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end