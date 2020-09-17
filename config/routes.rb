Rails.application.routes.draw do
#顧客サイト
  devise_for :customers, controllers: {
    registrations: 'publics/registrations',
    passwords: 'publics/passwords',
    sessions: 'publics/sessions'}
    #新規登録後商品一覧ページへ遷移
    root 'publics/items#index'

    scope module: :publics do
      get 'top' => 'homes#top'
      get 'about' => 'homes#about'

      resources :items, only: [:index, :show]

      get 'customers/my_page' => 'customers#show', as: 'customers'
      resource :customers, only: [:edit, :update]
      get 'customers/unsubscribe'
      patch 'customers/withdraw'

      resources :cart_items, only: [:index, :update, :destroy, :create]
      delete :cart_items, to: 'cart_items#destroy_all'

      resources :orders, only: [:new, :create, :index, :show]
      post 'orders/comfirm'
      get 'orders/complete'

      resources :addresses, only: [:index, :edit, :create, :update, :destroy]
    end

#管理者サイト
  devise_for :admins, controllers: {
    registrations: 'admins/registrations',
    passwords: 'admins/passwords',
    sessions: 'admins/sessions'}

    namespace :admins do
      get 'homes/top'

      resources :items, only: [:index, :new, :create, :show, :edit, :update]

      resources :genres, only: [:index, :create, :edit, :update]

      resources :customers, only: [:index, :show, :edit, :update]

      resources :orders, only: [:index, :show, :update] do
        resources :order_details, only: [:update]
      end
    end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
