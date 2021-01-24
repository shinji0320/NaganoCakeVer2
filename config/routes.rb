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

    resources :cart_items, only: [:index, :update, :destroy] do
      collection do
        delete 'empty'
      end
    end

    resources :items, only: [:index, :show, :create] do
      resources :cart_items, only: [:create]
    end

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
      resource :order_items, only: [:update]
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end