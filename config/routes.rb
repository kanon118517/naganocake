Rails.application.routes.draw do

    

    get 'cart_items' => "public/cart_items#index", as: 'cart_items'
    post 'cart_items' => "public/cart_items#create", as: 'create_cart_items'
    delete 'cart_items/all_destroy' => "public/cart_items#destroy_all", as: 'destroy_all'
    patch 'cart_items/:id' => "public/cart_items#update", as: 'update_cart_items'
    delete 'cart_items/:id' => "public/cart_items#destroy", as: 'destroy_cart_items'
    get 'items' => "public/items#index", as: 'items'
    get 'items/:id' => "public/items#show", as: 'item'
    
    get 'orders/new' => "public/orders#new", as: 'new_orders'
    get 'orders' => "pubulic/orders#index",as: 'orders'
    get 'orders/:id' => "pubulic/orders#show", as: 'show_orders'
    post 'orders/confirm' => "pubulic/orders#confirm", as: 'confirm_orders'
    get 'orders/complete' => "pubulic/orders#complete", as: 'complete_orders'
    post 'orders' => "public/orders#create", as: 'create_orders'

  namespace :admin do
    resources :items, only: [:new, :create, :index, :show, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
  end

  get 'customers/my_page' => "customers#show", as: 'my_page'
  get 'customers/information/edit' => "customers#edit", as: 'information'
  patch 'customers/information' => "customers#update", as: 'information_update'
  get 'customers/confirm' => "customers#confirm", as: 'confirm'
  patch '/withdrawal' => "customers#withdrawal"

  devise_for :admins, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  root to: 'homes#top'
  get "/about" => "homes#about", as: 'about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


end
