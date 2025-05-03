Rails.application.routes.draw do
#admin
  devise_for :admin, skip: [:registrations, :passwords], controllers:{
    sessions: "admin/sessions"
  }

  namespace :admin do
    root to: 'homes#top'
    resources :items, only: [:index, :show, :new, :edit, :create, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
    patch 'order_details/:id' => 'order_details#update', as: 'order_detail'
  end

#public
  devise_for :customers, skip: [:passwords], controllers:{
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  scope module: :public do

    get   "customers/my_page" => "customers#show"
    get   "customers/information/edit" => "customers#edit"
    patch "customers/information" => "customers#update"
    get   "customers/confirm" => "customers#confirm"
    patch "customers/quit" => "customers#quit"

    root to: 'homes#top'
    get 'about' => 'homes#about'

    resources :items, only: [:index, :show]

    delete 'cart_items/all_destroy' => 'cart_items#all_destroy'
    resources :cart_items, only: [:index, :update, :create, :destroy]

    post 'orders/confirm' => 'orders#confirm', as: 'order_confirm'
    get 'orders/decision' => 'orders#decision', as: 'order_decision'
    resources :orders, only: [:index, :new, :show, :create]

    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
