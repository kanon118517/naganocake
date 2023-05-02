Rails.application.routes.draw do

    get 'items' => "public/items#index", as: 'items'
    get 'items/:id' => "public/items#show", as: 'item'

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
