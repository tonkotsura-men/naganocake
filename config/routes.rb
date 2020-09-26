Rails.application.routes.draw do
  root 'publics/homes#top'
#顧客サイト
  devise_for :customers, controllers: {
    registrations: 'publics/registrations',
    passwords: 'publics/passwords',
    sessions: 'publics/sessions'}

    scope module: :publics do
      get 'top' => 'homes#top'
      get 'about' => 'homes#about'
      root 'homes#top'
      

      resources :items, only: [:index, :show]

      get 'customers/my_page' => 'customers#show', as: 'customers'
      get 'customers/edit_page' => 'customers#edit', as: 'edit_customers'
      patch 'customers/edit_page/:id' => 'customers#update', as: 'update_customers'
      # resource :customers, only: [:update]
      get 'customers/unsubscribe'
      patch 'customers/withdraw'

      resources :cart_items, only: [:index, :update, :destroy, :create]
      delete :cart_items, to: 'cart_items#destroy_all'


      post 'orders/confirm'
      get 'orders/complete'
      resources :orders, only: [:new, :create, :index, :show]


      resources :addresses, only: [:index, :edit, :create, :update, :destroy]
    end

#管理者サイト
  devise_for :admins, controllers: {
    registrations: 'admins/registrations',
    passwords: 'admins/passwords',
    sessions: 'admins/sessions'}

    namespace :admins do

      get 'top' => 'homes#top'

      get 'search' => 'items#seach'

      resources :items, only: [:index, :new, :create, :show, :edit, :update]

      resources :genres, only: [:index, :create, :edit, :update]

      resources :customers, only: [:index, :show, :edit, :update]

      resources :orders, only: [:index, :show, :update] do
        resources :order_details, only: [:update]
      end
    end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
